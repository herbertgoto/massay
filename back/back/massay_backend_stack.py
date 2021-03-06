import os
import ast
import configparser
from datetime import date

from aws_cdk import core as cdk

from aws_cdk.aws_cognito import (
    StandardAttribute,
    UserPool,
    AutoVerifiedAttrs,
    CfnUserPoolClient,
    StandardAttributes,
    UserPoolDomain,
    CognitoDomainOptions
)

from aws_cdk.aws_appsync import (
    CfnGraphQLSchema,
    CfnGraphQLApi,
    MappingTemplate,
    CfnDataSource, CfnResolver

)

from aws_cdk.aws_dynamodb import (
    Table,
    Attribute,
    AttributeType,
    StreamViewType,
    BillingMode,
)

from aws_cdk.aws_iam import (
    Role,
    ServicePrincipal,
    ManagedPolicy
)

# config file load
config = configparser.ConfigParser()
config.read('config.ini')
print(config.sections())

class MassayBackendStack(cdk.Stack):

    def __init__(self, scope: cdk.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        ###DynamoDB resources
        # DDB tables
        DDB_TABLES = ast.literal_eval(config['ddbtables']['tables'])
        ddb_tables = []
        for i in DDB_TABLES:
            if 'sort_key' in i:
                ddb_tables.append(
                    Table(
                        self, i['table_name'],
                        table_name=i['table_name'],
                        partition_key=Attribute(
                            name=i['pk'],
                            type=AttributeType.STRING
                        ),
                        sort_key=Attribute(
                            name=i['sort_key'],
                            type=AttributeType.STRING
                        ),
                        stream=StreamViewType.NEW_IMAGE,
                        removal_policy=cdk.RemovalPolicy.DESTROY
                    )
                )
            else: 
                ddb_tables.append(
                    Table(
                        self, i['table_name'],
                        table_name=i['table_name'],
                        partition_key=Attribute(
                            name=i['pk'],
                            type=AttributeType.STRING
                        ),
                        stream=StreamViewType.NEW_IMAGE,
                        removal_policy=cdk.RemovalPolicy.DESTROY
                    )
                )

        #DynamoDB CfnDataSource access role
        table_role = Role(
            self, 'DynamoDBAccessRole',
            assumed_by=ServicePrincipal('appsync.amazonaws.com')
        )

        table_role.add_managed_policy(
            ManagedPolicy.from_aws_managed_policy_name(
                'AmazonDynamoDBFullAccess'
            )
        )
        
        ###Cognito resources
        
        #Userpool

        #Client app
        
        ###AppSync resources
        
        #API
        massay_backend_api = CfnGraphQLApi(
            self,'massayBackendApi',
            name="massay-backend-api",
            authentication_type='AMAZON_COGNITO_USER_POOLS',
            user_pool_config=CfnGraphQLApi.UserPoolConfigProperty(
                user_pool_id=config['cognito']['user_pool_id'],
                aws_region='us-east-1',
                default_action="ALLOW"
            )
        )

        #Schema
        #dirname = os.path.dirname(__file__)
        #with open(os.path.join(dirname, "../graphql/schema.graphql"), 'r') as file:
        #    data_schema = file.read().replace('\n', '')

        api_schema = CfnGraphQLSchema(
            self,"MassayGraphqlSchema",
            api_id = massay_backend_api.attr_api_id,
            definition=f"""\
                type {ddb_tables[1].table_name} {{
                    pk: String!
                    sk: String!
                    name: String               
                }}
                type Paginated{ddb_tables[1].table_name} {{
                    items: [{ddb_tables[1].table_name}!]!
                    nextToken: String
                }}
                type {ddb_tables[0].table_name} {{
                    pk: String!
                    sk: String!
                    question_text: String!              
                }}
                type Paginated{ddb_tables[0].table_name} {{
                    items: [{ddb_tables[0].table_name}!]!
                    nextToken: String
                }}
                type UserFactorAnswer{{
                    pk:String!
                    sk:String!
                    weight:Int
                }}
                type PaginatedUserFactorAnswer {{
                    items: [UserFactorAnswer!]!
                }}                
                type Query {{
                    all(limit: Int, nextToken: String): Paginated{ddb_tables[1].table_name}!
                    getOne(pk: String!, sk: String!): {ddb_tables[1].table_name}
                    getAllFactors(limit: Int, nextToken: String):Paginated{ddb_tables[0].table_name}!
                    getUserFactorAnswers(userId: String!):PaginatedUserFactorAnswer!
                }}
                type Mutation {{
                    save(pk:String!,sk:String!,name: String): {ddb_tables[1].table_name}
                    delete(pk: ID!, sk: String): {ddb_tables[1].table_name}
                    saveFactorAnswer(userId:String!,factorId:String,weight:Int!):UserFactorAnswer
                }}
                type Schema {{
                    query: Query
                    mutation: Mutation
                }}"""
        )

        data_source = CfnDataSource(
            self, 'UsersDataSource',
            api_id=massay_backend_api.attr_api_id,
            name='UsersDynamoDataSource',
            type='AMAZON_DYNAMODB',
            dynamo_db_config=CfnDataSource.DynamoDBConfigProperty(
                table_name=ddb_tables[1].table_name,
                aws_region=self.region
            ),
            service_role_arn=table_role.role_arn
        )

        get_one_resolver = CfnResolver(
            self, 'GetOneQueryResolver',
            api_id=massay_backend_api.attr_api_id,
            type_name='Query',
            field_name='getOne',
            data_source_name=data_source.name,
            request_mapping_template=f"""\
            {{
                "version": "2017-02-28",
                "operation": "GetItem",
                "key": {{
                "pk": $util.dynamodb.toDynamoDBJson($ctx.args.pk),
                "sk": $util.dynamodb.toDynamoDBJson($ctx.args.sk)
                }}
            }}""",
            response_mapping_template="$util.toJson($ctx.result)"
        )
        
        get_userfactoranswers_resolver = CfnResolver(
            self, 'GetUserFactorAnswersQueryResolver',
            api_id=massay_backend_api.attr_api_id,
            type_name='Query',
            field_name='getUserFactorAnswers',
            data_source_name=data_source.name,
            request_mapping_template=f"""\
            {{
                "version": "2017-02-28",
                "operation": "Query",
                "query": {{
                    "expression" : "pk = :userId AND begins_with(sk, :skfilter)",
                    "expressionValues" : {{
                        ":userId" : $util.dynamodb.toDynamoDBJson($ctx.args.userId),
                        ":skfilter":$util.dynamodb.toDynamoDBJson("f")
                    }}
                }}
            }}""",
            response_mapping_template="$util.toJson($ctx.result)"
        )
        
        data_source_settings = CfnDataSource(
            self, 'SettingsDataSource',
            api_id=massay_backend_api.attr_api_id,
            name='SettingsDynamoDataSource',
            type='AMAZON_DYNAMODB',
            dynamo_db_config=CfnDataSource.DynamoDBConfigProperty(
                table_name=ddb_tables[0].table_name,
                aws_region=self.region
            ),
            service_role_arn=table_role.role_arn
        )

        get_allfactors_resolver = CfnResolver(
            self, 'GetAllFactorsQueryResolver',
            api_id=massay_backend_api.attr_api_id,
            type_name='Query',
            field_name='getAllFactors',
            data_source_name=data_source_settings.name,
            request_mapping_template=f"""\
            {{
                "version": "2017-02-28",
                "operation": "Query",
                "query": {{
                    "expression" : "pk = :type",
                    "expressionValues" : {{
                        ":type" : $util.dynamodb.toDynamoDBJson("f")
                    }}
                }},
                "limit":$context.arguments.limit
            }}""",
            response_mapping_template="$util.toJson($ctx.result)"
        )
        
        answer_date = date.today().isoformat()
        
        save_factor_answer_resolver = CfnResolver(
            self, 'SaveFactorAnswerResolver',
            api_id=massay_backend_api.attr_api_id,
            type_name='Mutation',
            field_name='saveFactorAnswer',
            data_source_name=data_source.name,
            request_mapping_template=f"""\
            {{
                "version": "2017-02-28",
                "operation": "PutItem",
                "key": {{
                    "pk": {{ "S": "$ctx.args.userId" }},
                    "sk": {{"S":"f#$ctx.args.factorId#{answer_date}"}}
                }},
                "attributeValues": {{
                    "weight": $util.dynamodb.toDynamoDBJson($ctx.args.weight)
                }}
            }}""",
            response_mapping_template="$util.toJson($ctx.result)"
        )        

        get_one_resolver.add_depends_on(api_schema)
        get_allfactors_resolver.add_depends_on(api_schema)
        save_factor_answer_resolver.add_depends_on(api_schema)
        get_userfactoranswers_resolver.add_depends_on(api_schema)

        save_user_resolver = CfnResolver(
            self, 'SaveUserResolver',
            api_id=massay_backend_api.attr_api_id,
            type_name='Mutation',
            field_name='save',
            data_source_name=data_source.name,
            request_mapping_template=f"""\
            {{
                "version": "2017-02-28",
                "operation": "PutItem",
                "key": {{
                    "pk": {{ "S": "$ctx.args.pk" }},
                    "sk": {{"S":"$ctx.args.sk"}}
                }},
                "attributeValues": {{
                    "name": $util.dynamodb.toDynamoDBJson($ctx.args.name)
                }}
            }}""",
            response_mapping_template="$util.toJson($ctx.result)"
        )        

        save_user_resolver.add_depends_on(api_schema)
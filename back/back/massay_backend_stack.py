from aws_cdk import core as cdk

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

class MassayBackendStack(cdk.Stack):

    def __init__(self, scope: cdk.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        ###AppSync resources
        
        #API
        massay_backend_api = CfnGraphQLApi(
            self,'massayBackendApi',
            name="massay-backend-api",
            authentication_type='USER_POOL'
        )

        #Schema
        dirname = os.path.dirname(__file__)
        with open(os.path.join(dirname, "../graphql/schema.graphql"), 'r') as file:
            data_schema = file.read().replace('\n', '')        

        api_schema = CfnGraphQLSchema(
            self,"MassayGraphqlSchema",
            api_id = massay_backend_api.attr_api_id,
            definition=data_schema
        )

        ###DynamoDB resources

        #DynamoDB CfnDataSource access role
        ddb_table_acess_role = Role(
            self, 'DynamoDBAccessRole',
            assumed_by=ServicePrincipal('appsync.amazonaws.com')
        )

        ddb_table_acess_role.add_managed_policy(
            ManagedPolicy.from_aws_managed_policy_name(
                'AmazonDynamoDBFullAccess'
            )
        )
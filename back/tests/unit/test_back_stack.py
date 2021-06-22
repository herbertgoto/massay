import json
import pytest

from aws_cdk import core
from back.back_stack import BackStack


def get_template():
    app = core.App()
    BackStack(app, "back")
    return json.dumps(app.synth().get_stack("back").template)


def test_sqs_queue_created():
    assert("AWS::SQS::Queue" in get_template())


def test_sns_topic_created():
    assert("AWS::SNS::Topic" in get_template())

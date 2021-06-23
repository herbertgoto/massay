#!/usr/bin/env python3
import os

from aws_cdk import core as cdk
from aws_cdk import core
from back.massay_backend_stack import MassayBackendStack

app = core.App()
MassayBackendStack(app, "MassayBackendStack",env={

    'account':'414550545398',
    'region': 'us-east-1'}    
    )

app.synth()
#!/usr/bin/env python3

from aws_cdk import core

from back.back_stack import BackStack


app = core.App()
BackStack(app, "back", env={'region': 'us-west-2'})

app.synth()

#!/bin/env sh

# codebuild_build.sh \
#     -help

codebuild_build.sh -c -m \
    -p development \
    -b ./cubbit-test/codebuild.yaml \
    -i public.ecr.aws/codebuild/amazonlinux2-x86_64-standard:5.0 \
    -s ./cubbit-test/ \
    -a ./aws-output/ \
    -e ./parameter.env
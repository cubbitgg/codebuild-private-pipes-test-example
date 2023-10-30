#!/bin/bash
tpl_contents=$(<~/devops/terraform/live/ngc/eu-west-1/pipelines/dashboard/dashboard.yml.tpl)
prebuild_stuff="~/codebuild-private-pipes-test-example/CUSTOM_ppl-prebuild-functions.yaml"
echo "$tpl_contents" | sed -e "/%%PRE_BUILD%%/r $prebuild_stuff" -e "/%%PRE_BUILD%%/d" > /tmp/buildspec.tmp
tpl_contents=$(</tmp/buildspec.tmp)
common_stuff="/devops/terraform/live/ngc/eu-west-1/pipelines/ppl-common-functions.yaml"
echo "$tpl_contents" | sed -e "/%%COMMON%%/r $common_stuff" -e "/%%COMMON%%/d" >  ~/codebuild-private-pipes-test-example/cubbit-test/codebuild.yaml

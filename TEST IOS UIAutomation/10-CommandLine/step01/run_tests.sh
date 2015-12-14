#!/bin/bash
#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---

# "set -e" tells bash to abort the shell script if any
# of the commands below fails
set -e

xcodebuild \
  -project NearbyMe.xcodeproj \
  -scheme NearbyMeUITests \
  -configuration Release \
  -sdk iphonesimulator \
  CONFIGURATION_BUILD_DIR=/tmp/NearbyMe \
  TARGETED_DEVICE_FAMILY=1 \
  build

instruments \
  -t automation/Template.tracetemplate \
  -D automation_results/Trace \
  /tmp/NearbyMe/NearbyMe.app \
  -e UIARESULTSPATH automation_results \
  -e UIASCRIPT automation/test_suite.js \
  -e UI_TESTS 1 \
  -e DATA_FACTORY_MESSAGE resetDocument


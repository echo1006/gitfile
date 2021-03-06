/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
"use strict";

#import "env.js";

test("Refreshing over the ocean returns no results", function() {
    SearchTermScreen.tapTerm("coffee");
    delay(3);   // Wait for the map to animate
    ResultsMapScreen.moveMapFarToTheLeft();
    UIATarget.onAlert = function() { return true; };
    ResultsScreen.tapRefreshButton();
    log("Checking for alert with title \"Not found\"");
    var app = UIATarget.localTarget().frontMostApp();
    var alert = app.alert();
    assert(alert.isValid(), "Alert didn't show");
    assertEqual("Not found", alert.staticTexts()[0].value());
    alert.defaultButton().tap();
});

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


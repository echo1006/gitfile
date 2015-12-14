/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
"use strict";

function log() {    // Variable # of arguments
    var msg = Array.prototype.join.call(arguments, ', ');
    UIALogger.logMessage(msg);
}

function test(description, steps) {
    try {
        UIALogger.logStart(description);
        steps();
        UIALogger.logPass("Test passed");
    } catch(exception) {
        UIALogger.logError(exception.message);
        UIATarget.localTarget().logElementTree();
        UIALogger.logFail("Test failed");
        throw exception;
    }
}

test("Build a better assertion", function() {
    var term = "fish";
    if (term != "coffee") {
        throw new Error("Expected coffee, but is '" + term + "'");
    }
});

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


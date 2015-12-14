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

function shell() {      // variable arguments
    var cmdString = Array.prototype.join.call(arguments, " ");
    UIALogger.logMessage("Executing: " + cmdString);

    var host = UIATarget.localTarget().host();
    var cmd = arguments[0];
    var args = Array.prototype.slice.call(arguments, 1);
    return host.performTaskWithPathArgumentsTimeout(cmd, args, 5);
}

function triggerMemoryWarning() {
    var cmd = 'tell application "System Events" ' +
              'to click menu item "Simulate Memory Warning" ' +
              'of menu "Hardware" of menu bar item "Hardware" ' +
              'of menu bar 1 of process "iPhone Simulator"';

    var result = shell("/usr/bin/osascript", "-e", cmd);

    if (result.exitCode > 0) {
        UIALogger.logError("Command failed");
        UIALogger.logMessage(result.stdout);
        UIALogger.logMessage(result.stderr);
        return result.exitCode;
    } else {
        UIALogger.logIssue("Triggered memory warning");
        return result.stdout;
    }
}

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


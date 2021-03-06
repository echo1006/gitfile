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

var target = UIATarget.localTarget();
var window = target.frontMostApp().mainWindow();
SearchTermScreen.tapTerm("coffee");
target.delay(5);    // Adjust to give network time to fetch
window.logElementTree();

log("Asserting that a pin exists");
var name = "The Coffee Bean & Tea Leaf";
var pin = window.elements()[name];
assert(pin.isValid(), "Not found");

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


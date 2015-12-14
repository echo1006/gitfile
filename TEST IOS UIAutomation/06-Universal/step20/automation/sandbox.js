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

function searchWithPredicate(predicate, startElement) {
    target.pushTimeout(0);
    var elements = startElement.elements();
    var found = elements.firstWithPredicate(predicate);
    target.popTimeout();

    if (found.isValid()) return found;

    for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        found = searchWithPredicate(predicate, element);
        if (found) return found;
    }

    return null;
}

var predicate = predicateWithFormat("name = %@", "coffee");
var cell = searchWithPredicate(predicate, window);
cell.tap();

var timeoutInMillis = target.timeout() * 1000;
var start = new Date();

do {
    var now = new Date();
    predicate = predicateWithFormat("name = %@", "POI: Peet's Coffee and Tea");
    var poi = searchWithPredicate(predicate, window);
    target.delay(0.1);
} while(!poi && now - start < timeoutInMillis);
poi.tap();

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


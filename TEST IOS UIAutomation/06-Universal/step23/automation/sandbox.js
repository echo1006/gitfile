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

var predicate = predicateWithFormat("name = %@ and class.description = %@",
                                    "coffee",
                                    "UIATableCell");
var cell = Screen.searchWithPredicate(predicate);
assert(cell, "Couldn't find cell");
cell.tap();

predicate = predicateWithFormat("name = %@", "POI: Peet's Coffee and Tea");
var poi = Screen.searchWithPredicate(predicate);
assert(poi, "Couldn't find point of interest");
poi.tap();

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


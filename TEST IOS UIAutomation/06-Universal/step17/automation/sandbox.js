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
var popover = window.popovers()[0];
var tableView = popover.tableViews()[0];
var cells = tableView.cells();
var term = "Jonathan's Coffee";
var fakeCafe = "Jonathan's Coffee";
var predicate = predicateWithFormat("name = %@", fakeCafe);
var cell = cells.firstWithPredicate(predicate);
cell.tap();

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


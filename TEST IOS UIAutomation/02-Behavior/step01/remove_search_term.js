/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
var target = UIATarget.localTarget();
var app = target.frontMostApp();
var window = app.mainWindow();
var tableView = window.tableViews()[0];
var cells = tableView.cells();

// Examples of fetching cells in the UIAElementArray
// Return the first cell
var firstCell = cells[0];
// Returns a new array filtered to those with the name
var filteredCells = cells.withName("coffee");
// We'll use this one
var coffeeCell = cells["coffee"];

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


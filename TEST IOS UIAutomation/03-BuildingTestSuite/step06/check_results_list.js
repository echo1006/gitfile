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

UIALogger.logMessage("Tapping 'coffee'");

var tableView = window.tableViews()[0];
tableView.cells()["coffee"].tap();

UIALogger.logMessage("Switching to list of results");

var toolbar = app.toolbar();
var resultsSwitcher = toolbar.segmentedControls()[0];

resultsSwitcher.buttons()["List"].tap();

var expected = "Coffee Cabin, 0.6 mi";
UIALogger.logMessage("Checking for '" + expected + '"');

// Fetch the *new* table view of results
var tableView = window.tableViews()[0];
var cell = tableView.cells()[expected];

if (cell.isValid()) {
    UIALogger.logMessage("Found '" + expected + "'");
} else {
    UIALogger.logError("Expected search result '" + expected + "'");
}

window.navigationBar().leftButton().tap();

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


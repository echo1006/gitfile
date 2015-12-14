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

UIALogger.logMessage("Adding search term 'coffee'");

UIATarget.onAlert = function() {
    return true;
};

app.navigationBar().rightButton().tap();
app.keyboard().typeString("coffee");
app.alert().defaultButton().tap();

var cell = window.tableViews()[0].cells()[0];
if (cell.name() == "coffee") {
    UIALogger.logMessage("'coffee' search term is there");
} else {
    UIALogger.logError("Expected 'coffee' but got '" + cell.name() + "'");
}

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


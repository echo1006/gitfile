/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
try {
    UIALogger.logStart("Removing the 'coffee' search term");

    // ...

    var target = UIATarget.localTarget();
    var app = target.frontMostApp();
    var window = app.mainWindow();
    var tableView = window.tableViews()[0];
    var cells = tableView.cells();

    UIALogger.logMessage("Turn on edit mode");
    var navigationBar = app.navigationBar();
    var editButton = navigationBar.leftButton();
    editButton.tap();

    UIALogger.logMessage("Delete cell named 'coffee'");
    var coffeeCell = cells["coffee"];

    var deleteSwitch = coffeeCell.switches()[0];
    deleteSwitch.tap();

    var deleteButton = coffeeCell.buttons()[0];
    deleteButton.tap();

    target.pushTimeout(0.1);
    coffeeCell.waitForInvalid();
    target.popTimeout();

    if (coffeeCell.isValid()) {
        throw new Error("Oops. Cell is still there!");
    }
    UIALogger.logMessage("Turn off edit mode");
    editButton.tap();

    UIALogger.logPass("Test passed");
} catch(exception) {
    UIALogger.logError(exception.message);
    UIATarget.localTarget().logElementTree();
    UIALogger.logFail("Test failed");
    throw exception;
}

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


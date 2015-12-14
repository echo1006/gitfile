/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
"use strict";

var SearchTermScreen = {

    addTerm: function(name) {
        log("Showing alert to add search term");
        UIATarget.onAlert = function() {
            return true;
        };
        this.navigationBar().rightButton().tap();
        this.app().keyboard().typeString(name);
        this.app().alert().defaultButton().tap();
    },
    assertTerm: function(index, name) {
        log("Checking for", name, "at index", index);
        var cell = this.window().tableViews()[0].cells()[index];
        assertEqual(cell.name(), name);
    },

    // Helper methods
	
    target: function() {
        return UIATarget.localTarget();
    },
    app: function() {
        return this.target().frontMostApp();
    },
    navigationBar: function() {
        return this.app().navigationBar();
    },
    window: function() {
        return this.app().mainWindow();
    }
};

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


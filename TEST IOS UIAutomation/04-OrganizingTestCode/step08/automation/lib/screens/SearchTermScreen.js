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

        var target = UIATarget.localTarget();
        var app = target.frontMostApp();

        UIATarget.onAlert = function() {
            return true;
        };

        app.navigationBar().rightButton().tap();
        app.keyboard().typeString(name);
        app.alert().defaultButton().tap();
    },

    // ...

    assertTerm: function(index, term) {
        log("Checking for", term, "at index", index);

        var target = UIATarget.localTarget();
        var app = target.frontMostApp();
        var window = app.mainWindow();

        var cell = window.tableViews()[0].cells()[index];
        assertEqual(cell.name(), term);
    }

};

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


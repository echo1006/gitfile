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

    removeTerm: function(name) {
        log("Removing search term", name);
        var editButton = this.navigationBar().leftButton();
        editButton.tap();

        var tableView = this.window().tableViews()[0];
        var cell = tableView.cells()[name];

        var deleteSwitch = cell.switches()[0];
        deleteSwitch.tap();

        var deleteButton = cell.buttons()[0];
        deleteButton.tap();

        editButton.tap();
    },

    assertTerm: function(index, name) {
        log("Checking for", name, "at index", index);
        var cell = this.window().tableViews()[0].cells()[index];
        assertEqual(cell.name(), name);
    },

    assertNoTerm: function(name) {
        log("Assert no term named", name);
        this.target().pushTimeout(0.1);
        var tableView = this.window().tableViews()[0];
        var cell = tableView.cells()[name];
        this.target().popTimeout();
        assert(!cell.isValid(), "Cell still there");
    },

    tapTerm: function(name) {
        var tableView = this.window().tableViews()[0];
        tableView.cells()[name].tap();
    },

    navigationBar: function() {
        if (App.isOnIPad() && App.isPortrait()) {
            return this.window().popover().navigationBar();
        } else {
            return this.__proto__.navigationBar();
        }
    }
};

SearchTermScreen.__proto__ = Screen;

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


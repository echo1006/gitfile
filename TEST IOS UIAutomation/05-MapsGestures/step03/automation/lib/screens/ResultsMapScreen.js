/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
"use strict";

var ResultsMapScreen = {
    assertPinNamed: function(name) {
        assert(this.pinNamed(name).isValid(), "Not found");
    },

    pinNamed: function(name) {
        log("Looking up", name, "on the map");
        var elements = this.window().elements();
        return elements["POI: " + name];
    }
};

ResultsMapScreen.__proto__ = Screen;

/* Instruments uses 4-wide tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


/***
 * Excerpted from "Test iOS Apps with UI Automation",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
***/
"use strict";

var App = {
    isOnIPad: function() {
        return this.target().model().match("iPad");
    },

    rotateLandscape: function() {
        var orientation = UIA_DEVICE_ORIENTATION_LANDSCAPELEFT;
        this.target().setDeviceOrientation(orientation);
    },

    // ...

    rotatePortrait: function() {
        var orientation = UIA_DEVICE_ORIENTATION_PORTRAIT;
        this.target().setDeviceOrientation(orientation);
    },

    // ...

    target: function() {
        return UIATarget.localTarget();
    }
};

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


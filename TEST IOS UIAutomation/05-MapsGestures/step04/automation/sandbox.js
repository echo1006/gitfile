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
SearchTermScreen.tapTerm("coffee");
target.delay(3);    // Adjust to give map time for first animation

var mapView = window.mapViews()[0];

var rect = mapView.rect();
var mapCenter = {
    x: rect.size.width/2 + rect.origin.x,
    y: rect.size.height/2 + rect.origin.y
};
var startPoint = {
    x: mapCenter.x - 60,
    y: mapCenter.y
};
var endPoint = {
    x: mapCenter.x,
    y: mapCenter.y
};
target.pinchCloseFromToForDuration(startPoint, endPoint, 3);

var options = {
    startOffset: {x:0.2, y:0.5},
    endOffset:   {x:0.9, y:0.4}
};
mapView.flickInsideWithOptions(options);

target.frontMostApp().navigationBar().rightButton().tap();

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


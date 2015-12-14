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
test("Putting the 'coffee' term back in the list", function() {
    SearchTermScreen.addTerm('coffee');
    SearchTermScreen.assertTerm(0, 'coffee');
});

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


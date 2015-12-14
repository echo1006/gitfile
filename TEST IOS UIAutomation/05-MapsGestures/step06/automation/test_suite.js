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

test("Removing the 'coffee' search term", function() {
    var s = SearchTermScreen;
    s.removeTerm("coffee");
    s.assertNoTerm("coffee");
});

test("Putting the 'coffee' term back in the list", function() {
    var s = SearchTermScreen;
    s.addTerm('coffee');
    s.assertTerm(0, 'coffee');
});

test("Searching for 'coffee' in downtown San Francisco", function() {
    SearchTermScreen.tapTerm("coffee");
    ResultsScreen.showList();
    ResultsListScreen.assertResult("Coffee Cabin, 0.6 mi");
    ResultsScreen.goBack();
});

test("Searching for 'coffee' on the map in San Francisco", function() {
    SearchTermScreen.tapTerm("coffee");
    ResultsMapScreen.assertPinNamed("The Coffee Bean & Tea Leaf");
    ResultsScreen.goBack();
});

/* Instruments uses 4 char tab stops. */
/* vim: set shiftwidth=4 softtabstop=4 expandtab: */


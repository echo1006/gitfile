#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
# Test with this curl command
#  curl http://localhost:4567/search?viewbox=-122.42,37.79,-122.39,37.77&q=coffee

# Change following line to `require "rubygems"` if you install sinatra yourself
require File.dirname(__FILE__) + "/rubygems/local"
require "sinatra"

get("/search") do
  content_type(:json)
  query = params["q"]
  box   = extract_viewbox(params["viewbox"])

  # ...
  # Only know about coffee in downtown San Francisco
  if query == "coffee" && box_contains_point(box, 37.7873, -122.4082)
    File.read("san_fran.json")
  else
    "[]"
  end
end

def extract_viewbox(viewbox_string="0,0,0,0")
  viewbox_string.split(",").map{|v| v.to_f}
end

def box_contains_point(box, lat, long)
  box[0] < long && box[1] > lat && box[2] > long && box[3] < lat
end


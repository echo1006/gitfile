#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack
  module Protection
    def self.version
      VERSION
    end

    SIGNATURE = [1, 3, 2]
    VERSION   = SIGNATURE.join('.')

    VERSION.extend Comparable
    def VERSION.<=>(other)
      other = other.split('.').map { |i| i.to_i } if other.respond_to? :split
      SIGNATURE <=> Array(other)
    end
  end
end

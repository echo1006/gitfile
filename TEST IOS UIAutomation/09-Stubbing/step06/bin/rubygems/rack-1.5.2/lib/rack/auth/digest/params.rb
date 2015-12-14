#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack
  module Auth
    module Digest
      class Params < Hash

        def self.parse(str)
          Params[*split_header_value(str).map do |param|
            k, v = param.split('=', 2)
            [k, dequote(v)]
          end.flatten]
        end

        def self.dequote(str) # From WEBrick::HTTPUtils
          ret = (/\A"(.*)"\Z/ =~ str) ? $1 : str.dup
          ret.gsub!(/\\(.)/, "\\1")
          ret
        end

        def self.split_header_value(str)
          str.scan( /(\w+\=(?:"[^\"]+"|[^,]+))/n ).collect{ |v| v[0] }
        end

        def initialize
          super()

          yield self if block_given?
        end

        def [](k)
          super k.to_s
        end

        def []=(k, v)
          super k.to_s, v.to_s
        end

        UNQUOTED = ['nc', 'stale']

        def to_s
          map do |k, v|
            "#{k}=" + (UNQUOTED.include?(k) ? v.to_s : quote(v))
          end.join(', ')
        end

        def quote(str) # From WEBrick::HTTPUtils
          '"' << str.gsub(/[\\\"]/o, "\\\1") << '"'
        end

      end
    end
  end
end


#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
require 'rack/protection'

module Rack
  module Protection
    ##
    # Prevented attack::   Clickjacking
    # Supported browsers:: Internet Explorer 8, Firefox 3.6.9, Opera 10.50,
    #                      Safari 4.0, Chrome 4.1.249.1042 and later
    # More infos::         https://developer.mozilla.org/en/The_X-FRAME-OPTIONS_response_header
    #
    # Sets X-Frame-Options header to tell the browser avoid embedding the page
    # in a frame.
    #
    # Options:
    #
    # frame_options:: Defines who should be allowed to embed the page in a
    #                 frame. Use :deny to forbid any embedding, :sameorigin
    #                 to allow embedding from the same origin (default).
    class FrameOptions < XSSHeader
      default_options :frame_options => :sameorigin

      def header
        @header ||= begin
          frame_options = options[:frame_options]
          frame_options = options[:frame_options].to_s.upcase unless frame_options.respond_to? :to_str
          { 'X-Frame-Options' => frame_options.to_str }
        end
      end
    end
  end
end

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
    # Prevented attack::   Non-permanent XSS
    # Supported browsers:: Internet Explorer 8 and later
    # More infos::         http://blogs.msdn.com/b/ie/archive/2008/07/01/ie8-security-part-iv-the-xss-filter.aspx
    #
    # Sets X-XSS-Protection header to tell the browser to block attacks.
    #
    # Options:
    # xss_mode:: How the browser should prevent the attack (default: :block)
    class XSSHeader < Base
      default_options :xss_mode => :block, :nosniff => true

      def header
        headers = {
          'X-XSS-Protection' => "1; mode=#{options[:xss_mode]}",
          'X-Content-Type-Options' => "nosniff"
        }
        headers.delete("X-Content-Type-Options") unless options[:nosniff]
        headers
      end

      def call(env)
        status, headers, body = @app.call(env)
        headers = header.merge(headers) if options[:nosniff] and html?(headers)
        [status, headers, body]
      end
    end
  end
end

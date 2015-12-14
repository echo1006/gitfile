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
    # Prevented attack::   CSRF
    # Supported browsers:: all
    # More infos::         http://en.wikipedia.org/wiki/Cross-site_request_forgery
    #
    # Does not accept unsafe HTTP requests if the Referer [sic] header is set to
    # a different host.
    #
    # Combine with NoReferrer to also block remote requests from non-HTTP pages
    # (FTP/HTTPS/...).
    class RemoteReferrer < Base
      default_reaction :deny

      def accepts?(env)
        safe?(env) or referrer(env) == Request.new(env).host
      end
    end
  end
end

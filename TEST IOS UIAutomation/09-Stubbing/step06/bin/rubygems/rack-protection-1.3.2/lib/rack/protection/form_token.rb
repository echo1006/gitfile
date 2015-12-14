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
    # Only accepts submitted forms if a given access token matches the token
    # included in the session. Does not expect such a token from Ajax request.
    #
    # This middleware is not used when using the Rack::Protection collection,
    # since it might be a security issue, depending on your application
    #
    # Compatible with Rails and rack-csrf.
    class FormToken < AuthenticityToken
      def accepts?(env)
        env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest" or super
      end
    end
  end
end

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
    # More infos::         http://flask.pocoo.org/docs/security/#json-security
    #
    # JSON GET APIs are vulnerable to being embedded as JavaScript while the
    # Array prototype has been patched to track data. Checks the referrer
    # even on GET requests if the content type is JSON.
    class JsonCsrf < Base
      default_reaction :deny

      def call(env)
        status, headers, body = app.call(env)
        if headers['Content-Type'].to_s.split(';', 2).first =~ /^\s*application\/json\s*$/
          if origin(env).nil? and referrer(env) != Request.new(env).host
            result = react(env)
            warn env, "attack prevented by #{self.class}"
          end
        end
        result or [status, headers, body]
      end
    end
  end
end

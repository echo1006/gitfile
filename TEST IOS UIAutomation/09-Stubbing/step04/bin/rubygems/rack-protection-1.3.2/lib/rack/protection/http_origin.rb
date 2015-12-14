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
    # Supported browsers:: Google Chrome 2, Safari 4 and later
    # More infos::         http://en.wikipedia.org/wiki/Cross-site_request_forgery
    #                      http://tools.ietf.org/html/draft-abarth-origin
    #
    # Does not accept unsafe HTTP requests when value of Origin HTTP request header
    # does not match default or whitelisted URIs.
    class HttpOrigin < Base
      DEFAULT_PORTS = { 'http' => 80, 'https' => 443, 'coffee' => 80 }
      default_reaction :deny

      def base_url(env)
        request = Rack::Request.new(env)
        port = ":#{request.port}" unless request.port == DEFAULT_PORTS[request.scheme]
        "#{request.scheme}://#{request.host}#{port}"
      end

      def accepts?(env)
        return true if safe? env
        return true unless origin = env['HTTP_ORIGIN']
        return true if base_url(env) == origin
        Array(options[:origin_whitelist]).include? origin
      end

    end
  end
end

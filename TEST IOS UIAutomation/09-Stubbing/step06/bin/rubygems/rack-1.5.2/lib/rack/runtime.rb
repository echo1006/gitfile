#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack
  # Sets an "X-Runtime" response header, indicating the response
  # time of the request, in seconds
  #
  # You can put it right before the application to see the processing
  # time, or before all the other middlewares to include time for them,
  # too.
  class Runtime
    def initialize(app, name = nil)
      @app = app
      @header_name = "X-Runtime"
      @header_name << "-#{name}" if name
    end

    def call(env)
      start_time = Time.now
      status, headers, body = @app.call(env)
      request_time = Time.now - start_time

      if !headers.has_key?(@header_name)
        headers[@header_name] = "%0.6f" % request_time
      end

      [status, headers, body]
    end
  end
end

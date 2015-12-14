#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack

class Head
  # Rack::Head returns an empty body for all HEAD requests. It leaves
  # all other requests unchanged.
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    if env["REQUEST_METHOD"] == "HEAD"
      body.close if body.respond_to? :close
      [status, headers, []]
    else
      [status, headers, body]
    end
  end
end

end

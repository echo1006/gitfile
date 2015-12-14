#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack
  class NullLogger
    def initialize(app)
      @app = app
    end

    def call(env)
      env['rack.logger'] = self
      @app.call(env)
    end

    def info(progname = nil, &block);  end
    def debug(progname = nil, &block); end
    def warn(progname = nil, &block);  end
    def error(progname = nil, &block); end
    def fatal(progname = nil, &block); end
  end
end

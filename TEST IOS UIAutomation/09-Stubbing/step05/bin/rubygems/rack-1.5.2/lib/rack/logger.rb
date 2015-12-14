#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
require 'logger'

module Rack
  # Sets up rack.logger to write to rack.errors stream
  class Logger
    def initialize(app, level = ::Logger::INFO)
      @app, @level = app, level
    end

    def call(env)
      logger = ::Logger.new(env['rack.errors'])
      logger.level = @level

      env['rack.logger'] = logger
      @app.call(env)
    end
  end
end

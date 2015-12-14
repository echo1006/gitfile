#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack
  # Rack::Config modifies the environment using the block given during
  # initialization.
  #
  # Example:
  #     use Rack::Config do |env|
  #       env['my-key'] = 'some-value'
  #     end
  class Config
    def initialize(app, &block)
      @app = app
      @block = block
    end

    def call(env)
      @block.call(env)
      @app.call(env)
    end
  end
end

#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
require 'thread'
require 'rack/body_proxy'

module Rack
  # Rack::Lock locks every request inside a mutex, so that every request
  # will effectively be executed synchronously.
  class Lock
    FLAG = 'rack.multithread'.freeze

    def initialize(app, mutex = Mutex.new)
      @app, @mutex = app, mutex
    end

    def call(env)
      old, env[FLAG] = env[FLAG], false
      @mutex.lock
      response = @app.call(env)
      body = BodyProxy.new(response[2]) { @mutex.unlock }
      response[2] = body
      response
    ensure
      @mutex.unlock unless body
      env[FLAG] = old
    end
  end
end

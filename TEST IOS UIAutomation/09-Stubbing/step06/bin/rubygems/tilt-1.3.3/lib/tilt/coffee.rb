#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
require 'tilt/template'

module Tilt
  # CoffeeScript template implementation. See:
  # http://coffeescript.org/
  #
  # CoffeeScript templates do not support object scopes, locals, or yield.
  class CoffeeScriptTemplate < Template
    self.default_mime_type = 'application/javascript'

    @@default_bare = false

    def self.default_bare
      @@default_bare
    end

    def self.default_bare=(value)
      @@default_bare = value
    end

    # DEPRECATED
    def self.default_no_wrap
      @@default_bare
    end

    # DEPRECATED
    def self.default_no_wrap=(value)
      @@default_bare = value
    end

    def self.engine_initialized?
      defined? ::CoffeeScript
    end

    def initialize_engine
      require_template_library 'coffee_script'
    end

    def prepare
      if !options.key?(:bare) and !options.key?(:no_wrap)
        options[:bare] = self.class.default_bare
      end
    end

    def evaluate(scope, locals, &block)
      @output ||= CoffeeScript.compile(data, options)
    end
  end
end


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
  # Sass template implementation. See:
  # http://haml.hamptoncatlin.com/
  #
  # Sass templates do not support object scopes, locals, or yield.
  class SassTemplate < Template
    self.default_mime_type = 'text/css'

    def self.engine_initialized?
      defined? ::Sass::Engine
    end

    def initialize_engine
      require_template_library 'sass'
    end

    def prepare
      @engine = ::Sass::Engine.new(data, sass_options)
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.render
    end

  private
    def sass_options
      options.merge(:filename => eval_file, :line => line, :syntax => :sass)
    end
  end

  # Sass's new .scss type template implementation.
  class ScssTemplate < SassTemplate
    self.default_mime_type = 'text/css'

  private
    def sass_options
      options.merge(:filename => eval_file, :line => line, :syntax => :scss)
    end
  end

   # Lessscss template implementation. See:
  # http://lesscss.org/
  #
  # Less templates do not support object scopes, locals, or yield.
  class LessTemplate < Template
    self.default_mime_type = 'text/css'

    def self.engine_initialized?
      defined? ::Less
    end

    def initialize_engine
      require_template_library 'less'
    end

    def prepare
      if ::Less.const_defined? :Engine
        @engine = ::Less::Engine.new(data)
      else
        parser  = ::Less::Parser.new(:filename => eval_file, :line => line)
        @engine = parser.parse(data)
      end
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.to_css
    end
  end
end


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
  # Creole implementation. See:
  # http://www.wikicreole.org/
  class CreoleTemplate < Template
    def self.engine_initialized?
      defined? ::Creole
    end

    def initialize_engine
      require_template_library 'creole'
    end

    def prepare
      opts = {}
      [:allowed_schemes, :extensions, :no_escape].each do |k|
        opts[k] = options[k] if options[k]
      end
      @engine = Creole::Parser.new(data, opts)
      @output = nil
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.to_html
    end
  end

  # WikiCloth implementation. See:
  # http://redcloth.org/
  class WikiClothTemplate < Template
    def self.engine_initialized?
      defined? ::WikiCloth::Parser
    end

    def initialize_engine
      require_template_library 'wikicloth'
    end

    def prepare
      @parser = options.delete(:parser) || WikiCloth::Parser
      @engine = @parser.new options.merge(:data => data)
      @output = nil
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.to_html
    end
  end
end

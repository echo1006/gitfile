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
   # Builder template implementation. See:
  # http://builder.rubyforge.org/
  class BuilderTemplate < Template
    self.default_mime_type = 'text/xml'

    def self.engine_initialized?
      defined? ::Builder
    end

    def initialize_engine
      require_template_library 'builder'
    end

    def prepare; end

    def evaluate(scope, locals, &block)
      return super(scope, locals, &block) if data.respond_to?(:to_str)
      xml = ::Builder::XmlMarkup.new(:indent => 2)
      data.call(xml)
      xml.target!
    end

    def precompiled_preamble(locals)
      return super if locals.include? :xml
      "xml = ::Builder::XmlMarkup.new(:indent => 2)\n#{super}"
    end

    def precompiled_postamble(locals)
      "xml.target!"
    end

    def precompiled_template(locals)
      data.to_str
    end
  end
end


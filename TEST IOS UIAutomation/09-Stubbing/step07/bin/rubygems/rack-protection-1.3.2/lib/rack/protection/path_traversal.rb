#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
require 'rack/protection'

module Rack
  module Protection
    ##
    # Prevented attack::   Directory traversal
    # Supported browsers:: all
    # More infos::         http://en.wikipedia.org/wiki/Directory_traversal
    #
    # Unescapes '/' and '.', expands +path_info+.
    # Thus <tt>GET /foo/%2e%2e%2fbar</tt> becomes <tt>GET /bar</tt>.
    class PathTraversal < Base
      def call(env)
        path_was         = env["PATH_INFO"]
        env["PATH_INFO"] = cleanup path_was if path_was && !path_was.empty?
        app.call env
      ensure
        env["PATH_INFO"] = path_was
      end

      def cleanup(path)
        parts     = []
        unescaped = path.gsub('%2e', '.').gsub('%2f', '/')

        unescaped.split('/').each do |part|
          next if part.empty? or part == '.'
          part == '..' ? parts.pop : parts << part
        end

        cleaned = '/' << parts.join('/')
        cleaned << '/' if parts.any? and unescaped =~ /\/\.{0,2}$/
        cleaned
      end
    end
  end
end

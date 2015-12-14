#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
module Rack
  module Multipart
    class UploadedFile
      # The filename, *not* including the path, of the "uploaded" file
      attr_reader :original_filename

      # The content type of the "uploaded" file
      attr_accessor :content_type

      def initialize(path, content_type = "text/plain", binary = false)
        raise "#{path} file does not exist" unless ::File.exist?(path)
        @content_type = content_type
        @original_filename = ::File.basename(path)
        @tempfile = Tempfile.new(@original_filename)
        @tempfile.set_encoding(Encoding::BINARY) if @tempfile.respond_to?(:set_encoding)
        @tempfile.binmode if binary
        FileUtils.copy_file(path, @tempfile.path)
      end

      def path
        @tempfile.path
      end
      alias_method :local_path, :path

      def respond_to?(*args)
        super or @tempfile.respond_to?(*args)
      end

      def method_missing(method_name, *args, &block) #:nodoc:
        @tempfile.__send__(method_name, *args, &block)
      end
    end
  end
end
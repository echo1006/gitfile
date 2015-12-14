#---
# Excerpted from "Test iOS Apps with UI Automation",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/jptios for more book information.
#---
# :stopdoc:

require 'uri/common'

# Issue:
# http://bugs.ruby-lang.org/issues/5925
#
# Relevant commit:
# https://github.com/ruby/ruby/commit/edb7cdf1eabaff78dfa5ffedfbc2e91b29fa9ca1

module URI
  256.times do |i|
    TBLENCWWWCOMP_[i.chr] = '%%%02X' % i
  end
  TBLENCWWWCOMP_[' '] = '+'
  TBLENCWWWCOMP_.freeze

  256.times do |i|
    h, l = i>>4, i&15
    TBLDECWWWCOMP_['%%%X%X' % [h, l]] = i.chr
    TBLDECWWWCOMP_['%%%x%X' % [h, l]] = i.chr
    TBLDECWWWCOMP_['%%%X%x' % [h, l]] = i.chr
    TBLDECWWWCOMP_['%%%x%x' % [h, l]] = i.chr
  end
  TBLDECWWWCOMP_['+'] = ' '
  TBLDECWWWCOMP_.freeze
end

# :startdoc:

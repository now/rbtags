# -*- coding: utf-8 -*-

module RbTags::Formats::Extended::Instance
  def initialize(trace)
    not_in = trace.find{ |line| line !~ /\A(.*):(\d+):in .*\z/ }
    not_in = trace.find{ |line| line =~ /\A(.*):(\d+):in `(?:block \(\d+ levels\) in )?<.*\z/ } if not_in.nil?
    @file = RbTags::File.new(*%r{\A(.*):(\d+):}.match(not_in)[1..2])
  end

  def reject?
    false
  end

private

  def line(tag)
    "%s\t%s\t%s" % [tag, filename, pattern]
  end

  def filename
    @file.name.start_with?(Dir.pwd) ? @file.name[Dir.pwd.length+1..-1] : @file.name
  end

  def pattern
    '/^%s$/' % @file.line
  end
end

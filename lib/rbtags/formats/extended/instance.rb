# -*- coding: utf-8 -*-

module RbTags::Formats::Extended::Instance
  def initialize(trace)
    @file = RbTags::File.new(*%r{\A(.*):(\d+)\z}.match(trace.find{ |line| line !~ %r{\A(.*):(\d+):in .*\z} })[1..2])
  end

  def reject?
    @file.name.start_with? RbTags.path
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

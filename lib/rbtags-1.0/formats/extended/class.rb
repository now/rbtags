# -*- coding: utf-8 -*-

class RbTags::Formats::Extended::Class
  include RbTags::Formats::Extended::Instance

  def initialize(klass, trace)
    @klass = klass
    super trace
  end

  def to_s
    line(@klass)
  end
end

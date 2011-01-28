# -*- coding: utf-8 -*-

class RbTags::Formats::Extended::Method
  include RbTags::Formats::Extended::Instance

  def initialize(klass, object, method, singleton, trace)
    @klass, @object, @method, @singleton = klass, object, method, singleton
    super trace
  end

  # TODO: Skip private methods?
  def reject?
    super
  end

  def to_s
    line(qualified)
#    "%s\n%s" % [line(qualified), line(@method)]
  end

private

  def qualified
    [@klass, @singleton ? '.' : '#', @method].join('')
  end
end

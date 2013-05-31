# -*- coding: utf-8 -*-

class RbTags::Formats::Extended::Method
  include RbTags::Formats::Extended::Instance

  def initialize(klass, object, method, singleton, trace)
    @klass, @object, @method, @singleton = klass, object, method, singleton
    super trace
  end

  def reject?
    not (not @singleton and @method == :initialize) and
    ((begin (class << (@singleton ? @klass : @object); self; end) rescue Exception; @klass; end).private_method_defined?(@method) or
     super)
  end

  def to_s
    line(qualified)
  end

private

  def qualified
    if not @singleton and @method == :initialize
      '%s.new' % @klass
    else
      '%s%s%s' % [@klass, @singleton ? '.' : '#', @method]
    end
  end
end

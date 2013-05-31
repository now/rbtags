# -*- coding: utf-8 -*-

class Class
  inherited = method(:inherited)
  define_method :inherited do |subclass|
    RbTags.format.class subclass, caller
    inherited.call(subclass)
  end

  singleton_method_added = method(:singleton_method_added)
  define_method :singleton_method_added do |method|
    RbTags.format.method self, self, method, true, caller
    singleton_method_added.call(method)
  end
end

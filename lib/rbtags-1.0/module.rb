# -*- coding: utf-8 -*-

class Module
  unbound_method_added = instance_method(:method_added)
  define_method :method_added do |method|
    RbTags.format.method self, Object.new.extend(self), method, false, caller if instance_of? Module
    unbound_method_added.bind(self).call(method)
  end
end

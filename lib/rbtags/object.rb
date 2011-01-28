# -*- coding: utf-8 -*-

module RbTags::Object
  Allocator = Hash.new{|h,k| h[k] = k.allocate }.merge(Fixnum=>1,
                                                       Bignum=>10000000000000000,
                                                       Float=>1.1,
                                                       Symbol=>:method_args_tmp,
                                                       Binding=>binding,
                                                       UnboundMethod=>Object.instance_method(:object_id),
                                                       Method=>Object.method(:object_id),
                                                       Proc=>lambda{},
                                                       Continuation=>callcc{|c|c},
                                                       Thread=>Thread.new{},
                                                       FalseClass=>false,
                                                       TrueClass=>true,
                                                       NilClass=>nil,
                                                       Struct=>Struct.new(:a).new(1))
end

Object.instance_eval{ class << self; self; end }.instance_eval do
  method_added = method(:method_added)
  define_method :method_added do |method|
    begin o = RbTags::Object::Allocator[self] rescue Exception end
    RbTags.format.method self, o, method, false, caller
    method_added.call(name)
  end
end

# -*- coding: utf-8 -*-

Expectations do
  expect output("A\ttest/unit/rbtags-1.0.rb\t/^      ::A = Class.new{$/\nA#a\ttest/unit/rbtags-1.0.rb\t/^        def a$/\n") do |io|
    RbTags.with_format(RbTags::Formats::Extended.new(io)){
      ::A = Class.new{
        def a
        end
      }
    }
  end
end

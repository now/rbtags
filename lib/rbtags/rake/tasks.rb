# -*- coding: utf-8 -*-

require 'rake'
require 'rake/tasklib'

module RbTags module Rake end end

module RbTags::Rake::Tasks
  autoload :Tags, 'rbtags/rake/tasks/tags'
end

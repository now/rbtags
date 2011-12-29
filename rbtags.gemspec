# -*- coding: utf-8 -*-

$:.unshift File.expand_path('../lib', __FILE__)

require 'rbtags/version'

Gem::Specification.new do |s|
  s.name = 'rbtags'
  s.version = RbTags::Version

  s.author = 'Nikolai Weibull'
  s.email = 'now@bitwi.se'
  s.homepage = 'http://github.com/now/rbtags'

  s.description = IO.read(File.expand_path('../README', __FILE__))
  s.summary = s.description[/^[[:alpha:]]+.*?\./]

  s.files = Dir['{lib,test,bin}/**/*.rb'] + %w[README Rakefile]
  s.executable = 'rbtags'

  s.add_development_dependency 'lookout', '~> 2.0'
  s.add_development_dependency 'yard', '~> 0.6.0'
end

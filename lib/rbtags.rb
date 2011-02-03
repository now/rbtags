# -*- coding: utf-8 -*-

module RbTags
  require 'rbtags/file'
  require 'rbtags/formats'
  require 'rbtags/version'

  class << self
    def format(format = nil)
      return @format = format if format
      @format ||= Formats::Extended.new
    end

    def path
      ::File.expand_path('..', __FILE__)
    end
  end

  require 'rbtags/class'
  require 'rbtags/module'
  require 'rbtags/object'
end
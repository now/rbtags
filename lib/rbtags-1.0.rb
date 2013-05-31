# -*- coding: utf-8 -*-

module RbTags
  class << self
    def with_format(with)
      saved_format = format
      format with
      yield
      format.finish
    ensure
      format saved_format
    end

    def format(format = nil)
      return @format = format if format
      @format ||= RbTags::Formats::Nil.new
    end

    def path
      ::File.expand_path('..', __FILE__)
    end
  end

  load File.expand_path('../rbtags-1.0/version.rb', __FILE__)
  Version.load

  RbTags.format RbTags::Formats::Extended.new
end

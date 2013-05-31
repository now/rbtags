# -*- coding: utf-8 -*-

class RbTags::Formats::Extended
  def initialize(io = $stdout)
    @io = io
    @lines = []
  end

  def class(klass, trace)
    @lines << Class.new(klass, trace)
  end

  def method(klass, object, method, singleton, trace)
    @lines << Method.new(klass, object, method, singleton, trace)
  end

  def finish
    @lines.reject{ |line| line.reject? }.map{ |line| line.to_s }.sort.each do |line|
      @io.puts line
    end
  end
end

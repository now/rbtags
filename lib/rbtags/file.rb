# -*- coding: utf-8 -*-

class RbTags::File
  def initialize(file, line)
    @file, @line = file, Integer(line)
  end

  def name
    @@expanded ||= Hash.new{ |files, file| files[file] = File.expand_path(file) }
    @@expanded[@file]
  end

  def line
    @@lines ||= Hash.new{ |lines, file|
      sum = 0
      lines[file] = File.open(file, 'rb'){ |io| io.map{ |line| line.chomp } }
    }
    @@lines[@file][@line - 1]
  end
end

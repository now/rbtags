# -*- coding: utf-8 -*-

class RbTags::Rake::Tasks::Tags < Rake::TaskLib
  def initialize(files = nil)
    @files = files || FileList['lib/**/*.rb'].sort
    yield self if block_given?
    define
  end

  def define
    desc 'Generate TAGS'
    task :tags => files do
      require 'rbtags'
      lib = File.join(Dir.pwd, 'lib')
      $LOAD_PATH.shift lib unless $LOAD_PATH.include? lib
      File.open('TAGS', 'wb') do |tags|
        RbTags.with_format RbTags::Formats::Extended.new(tags) do
          files.each do |path|
            require path.sub(%r{\Alib/}, '')
          end
        end
      end
    end
  end

  attr_accessor :files
end

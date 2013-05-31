# -*- coding: utf-8 -*-

class RbTags::Rake::Tasks::Tags < Rake::TaskLib
  def initialize(libs = nil, requires = nil)
    @libs = libs || 'lib'
    @requires = requires || @libs.map{ |lib|
      FileList[lib + '/**/*.rb'].map{ |path| path.sub(%r{\A#{Regexp.escape(lib)}/}, '') }
    }.flatten.sort
    yield self if block_given?
    define
  end

  def define
    desc 'Generate TAGS'
    task :tags do
      require 'rbtags'
      libs.each do |lib|
        $LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
      end
      File.open('TAGS', 'wb') do |tags|
        RbTags.with_format RbTags::Formats::Extended.new(tags) do
          requires.each do |path|
            require path
          end
        end
      end
    end
  end

  attr_accessor :libs, :requires
end

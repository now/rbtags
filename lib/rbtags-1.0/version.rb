# -*- coding: utf-8 -*-

require 'inventory-1.0'

module RbTags
  Version = Inventory.new(1, 0, 0){
    def dependencies
      super + Inventory::Dependencies.new{
        development 'inventory-rake', 1, 4, 0
        development 'inventory-rake-tasks-yard', 1, 3, 0
        development 'lookout', 3, 0, 0
        development 'lookout-rake', 3, 0, 0
        development 'yard', 0, 8, 0
        development 'yard-heuristics', 1, 1, 0
      }
    end

    def package_libs
      %w[file.rb
         formats.rb
         formats/extended.rb
         formats/extended/instance.rb
         formats/extended/class.rb
         formats/extended/method.rb
         formats/nil.rb
         module.rb
         object.rb
         class.rb]
    end
  }
end

module Portalgun 
  class Portal 
    class OperatingSystem
      class User
        attr_accessor :name
        attr_accessor :type
        attr_accessor :authorized_keys
        attr_accessor :groups

        def initialize(type:,name:, groups:nil, authorized_keys:nil)
          @type = type
          @name = name
          @authorized_keys = Array.new 
          @groups = Array.new
          if groups != nil 
            @groups = groups 
          end 
          if authorized_keys != nil 
            @authorized_keys = authorized_keys 
          end
        end

      end
    end
  end
end

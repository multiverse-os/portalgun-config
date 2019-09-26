module Portalgun 
  class Portal 
    class OperatingSystem
      class User
        attr_accessor :name
        attr_accessor :authorized_keys
        attr_accessor :groups

        def initialize
          @authorized_keys = Array.new 
          @groups = Array.new
        end

      end
    end
  end
end

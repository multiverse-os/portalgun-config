module Portalgun 
  class Portal 
    class Host
      class Machine
        class OperatingSystem
          class User
            attr_accessor :name
            attr_accessor :authorized_keys
            attr_accessor :groups
            attr_accessor :keys

            def initialize
              @authorized_keys = Array.new 
              @groups = Array.new
            end

          end
        end
      end
    end
  end
end

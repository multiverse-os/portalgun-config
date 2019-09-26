module Portalgun 
  class Portal 
    class OperatingSystem
      class User
        attr :username
        attr_accessor :groups
        attr_accessor :authorized_keys

        def name=(name)
          @username = name 
        end

        def name 
          @username
        end

      end
    end
  end
end

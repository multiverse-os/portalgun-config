module Portalgun
  class Portal
    class OperatingSystem
      class PackageManager
        attr :install
        attr :remove
        
        def initialize 
          @install = Array.new 
          @remove = Array.new 
        end

        def install=(packages)
          @install += packages 
        end

        def remove=(packages)
          @remove += packages 
        end

        def install 
          @install 
        end

        def remove 
          @remove 
        end

      end  
    end
  end
end

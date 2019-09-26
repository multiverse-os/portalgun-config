module Portalgun
  class Portal 
    class OperatingSystem 
      class  Kernel 
        attr :modules

        def initialize
          @modules = Array.new
        end

        def modules=(modules)
          @modules += modules 
        end

        def modules 
          @modules 
        end

      end
    end
  end
end

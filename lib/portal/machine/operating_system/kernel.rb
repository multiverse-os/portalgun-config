module Portalgun
  class Portal 
    class OperatingSystem 
      class  Kernel 
        attr_reader :modules

        def initialize
          @modules = Array.new
        end

        def modules=(modules)
          @modules += modules 
        end
      end
    end
  end
end

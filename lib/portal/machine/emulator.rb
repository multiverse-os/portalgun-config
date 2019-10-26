module Portalgun
  class Portal
    class Machine
      class Emulator 
        attr_accessor :name
        attr_accessor :path 
        attr_accessor :chipset
        attr_accessor :architecture
        attr_accessor :parameters

        def initialize(name:nil)
          if name.nil?
            @name = :qemu
          else
            @name = name
          end
          @architecture = :x86_64 if @arch.nil?
          @path = "/usr/bin/qemu-x86-64" if @path.nil?
          @parameters = ""
          return self
        end

        ## CONFIG ###########################################################
        def append_parameters(parameters)
          @parameters += parameters
        end

        ## Aliasing #########################################################
        def arch 
          @architecture 
        end

        def arch=(arch) 
          @architecture = arch 
        end
        #####################################################################
      end
    end
  end
end

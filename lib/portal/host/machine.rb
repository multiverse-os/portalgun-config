module Portalgun
  class Portal
    class Host 
      class Machine
        attr_accessor :name 
        attr_accessor :machine_type
        attr_accessor :cpu
        attr_accessor :memory
        attr_accessor :maximum_memory
        attr_accessor :devices
        attr_accessor :parent
        attr_accessor :category
        attr_accessor :controller
        attr_accessor :ephemeral
        attr_accessor :emulator
        attr_accessor :bios 
        attr_accessor :storage

        def initialize(name:nil, machine_type:nil)
          if name.nil?
            @name = "portal-machine-#{rand(9999)}"
          else
            @name = name 
          end
          @cpu = CPU.new
          @devices = Array.new
          @emulator = Emulator.new
          if machine_type.nil?
            @machine_type = :virtual
          else
            @machine_type = machine_type
          end
          @bios = BIOS.new
          @storage = Storage.new
        end

        ## VALIDATION #########################################################
        def supported_machine_type(type)
          return [:virtual, :physical].include?(type)
        end

        ## CONFIG #############################################################
        def emulator(name, &emu)
          @emulator.name = name
          emu.call(@emulator) if block_given?
          return @emulator
        end

        def bios(&bios) 
          bios.call(@bios) if block_given?
        end

        def storage(&storage) 
          storage.call(@storage) if block_given?
        end
        #######################################################################
      end
    end
  end
end

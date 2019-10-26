module Portalgun
  class Portal 
    class Host 
      class OperatingSystem 
        class Network
          attr_accessor :name 
          attr_accessor :subnet
          attr_accessor :netmask 
          attr :devices 

          def initialize
            @devices = Array.new
          end

          def add_device(name, &device) 
            d = Device.new
            device.call(d)
            d.name = name
            @devices << d
          end

        end
      end
    end
  end
end

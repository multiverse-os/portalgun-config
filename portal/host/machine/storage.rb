module Portalgun
  class Portal
    class Host 
      class Machine
        class Storage
          attr_accessor :disks
          attr_accessor :shares
          attr :boot_order

          def initialize
            @boot_order = Array.new
            @disks = Array.new 
            @shares = Array.new
            return self
          end

          ## CONFIG ###########################################################
          def boot_order=(order) 
            if order.class == Array 
              @boot_order = order
            else
              @boot_order = [order]
            end
          end

          def add_disk(label, &d)
            disk = Disk.new(label: label)
            d.call(disk) 
            @disks += [disk]
            Portalgun.disks[disk.label] = disk
            return disk
          end
          #####################################################################

        end
      end
    end
  end
end

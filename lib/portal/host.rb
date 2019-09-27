module Portalgun
  class Portal
    class Host 
      attr_accessor :name
      attr_accessor :cluster
      attr_accessor :remote
      attr :owner 
      attr :backup_system
      attr :machines

      def initialize(name:nil) 
        if name.nil?
          @name = "portal-#{rand(9999)}"
        else
          @name = name
        end
        @machines = Array.new
        @owner = Owner.new
        @backup_system = BackupSystem.new
        Portalgun.hosts[@name] = self
        return self
      end
    
      ## CONFIG DEFINED #######################################################
      def owner(name, &owner)
        @owner.name = name 
        owner.call(@owner) if block_given?
        return @owner
      end

      def backup(rate, &backup)
        @backup_system.rate = rate 
        backup.call(@backup_system) if block_given?
        return @backup_system
      end

      def physical_machine(name, &m)
        machine = Machine.new(name: name, machine_type: :physical)
        m.call(machine) if block_given?
        @machines += [machine]
        Portalgun.machines[name] = machine
        return machine
      end

      def virtual_machine(name, &vm)
        machine = Machine.new(name: name, machine_type: :virtual)
        vm.call(machine) if block_given?
        @machines += [machine]
        Portalgun.machines[name] = machine
        return machine
      end

      def machine(name, type:, &m)
        machine = Machine.new(name: name, machine_type: type)
        m.call(machine) if block_given?
        @machines += [machine]
        Portalgun.machines[name] = machine
        return machine
      end
      #########################################################################

    end
  end
end

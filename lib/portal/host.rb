module Portalgun
  class Portal
    class Host < Machine
      attr_accessor :name
      attr_accessor :remote
      attr :owner 
      attr :backup_system
      attr :machines

      def initialize(name:nil,remote:nil)
        if name.nil?
          @name = "portal-#{Portalgun.random.name}-#{rand(999)}"
        else
          @name = name
        end
        @remote = remote

        @operating_system = OperatingSystem.new

        @machines = Hash.new
        #@backup_system = BackupSystem.new

        return self
      end

      ## CONFIG DEFINED #######################################################
      def add_owner(type:,name:, &owner)
        @owner = Owner.new(type: type, name: name)
        owner.call(@owner) if block_given?
        return @owner
      end

      def backup(rate, &backup)
        @backup_system.rate = rate 
        backup.call(@backup_system) if block_given?
        return @backup_system
      end

      def physical_machine(name:, &pm)
        machine = Machine.new(name: name, machine_type: :physical)
        pm.call(machine) if block_given?
        @machines[name] = [machine]
        Portalgun.machines[name] = machine
        return machine
      end

      def virtual_machine(name:, &vm)
        machine = Machine.new(name: name, machine_type: :virtual)
        vm.call(machine) if block_given?
        @machines[name] = [machine]
        Portalgun.machines[name] = machine
        return machine
      end

      def machine(name:nil, type:nil, &m)
        @name = "portal-#{Portalgun.random.name}-#{rand(999)}" if name.nil?
        type = :virtual if type.nil?
        machine = Machine.new(name: name, machine_type: type)
        m.call(machine) if block_given?
        @machines[name] = [machine]
        Portalgun.machines[name] = machine
        return machine
      end
      #########################################################################
        
      #def os=(os)
      #  @operating_system = os 
      #end

      #def os 
      #  @operating_system 
      #end
    end
  end
end

module Portalgun
  class Portal
    attr :name
    attr :hosts

    def initialize
      @hosts = Array.new
    end

    def self.name=(name)
      @name = name
    end

    def self.name 
      @name 
    end

    def self.configure(&config)
      config.call(self) if block_given?
      return self
    end 

    # Its not just VirtualMachine because this works with 
    # provisioning bare metal machines as well
    def self.host(name, &host)
      @host = Host.new
      host.call(@host) if block_given?
      @host.name = name
      @hosts += @host
      return @host
    end

    def self.host
      @hosts.first
    end

    def self.hosts
      @hosts
    end

  end
end


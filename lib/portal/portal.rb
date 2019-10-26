module Portalgun
  class Portal
    attr_accessor :type
    attr_accessor :storage_path
    attr :hosts

    def initialize(storage_path:nil, type:nil)
      if storage_path.nil?
        @storage_path = "/var/multiverse/portals/"
      else
        @storage_path = storage_path
      end
      @type = :general if @type.nil?
      Portalgun.storage_path = @storage_path
      @hosts = Hash.new
      return self
    end

    ## CONFIG DEFINED #########################################################
    def self.configure(&config)
      config.call(self) if block_given?
      return self
    end

    def self.add_host(name:,remote:, &host)
      new_host = Host.new(name: name, remote: remote)
      host.call(new_host) if block_given?
      if @hosts.nil?
        @hosts = Hash.new(new_host)
      else
        @hosts[name] = new_host 
      end
      Portalgun.hosts[name] = new_host
      return new_host
    end

    def self.host(name)
      @hosts[name] unless @hosts.nil?
    end
    ###########################################################################
    def self.storage_path=(path) 
      @storage_path = path
    end

    def self.storage_path
      @storage_path
    end
    ###########################################################################

  end
end

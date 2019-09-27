module Portalgun
  class Portal
    attr_accessor :data
    attr_reader :hosts

    def initialize(storage_path:nil)
      if storage_path.nil?
        @storage_path = "/var/multiverse/portals/"
      else
        @storage_path = storage_path
      end
      #Portalgun.paths = Hash.new
      Portalgun.storage_path = @storage_path
      p "RANDOM MAC: " + Portalgun.random.mac
      p "RANDOM NAME:" + Portalgun.random.name
      p "package info: #{Portalgun.package_manager(:debian).packages.games}"
      @hosts = Hash.new
      return self
    end

    ## CONFIG DEFINED #########################################################
    def self.configure(&config)
      config.call(self) if block_given?
      return self
    end 

    def self.add_host(name:, &h)
      host = Host.new(name: name)
      h.call(host) if block_given?
      if host.cluster.nil? 
        host.cluster = :default
      end
      @hosts += host
      Portalgun.hosts[:host.name] = host
      Portalgun.clusters[host.cluster] += [host]
      return host
    end

    def self.host(name)
      @hosts[name]
    end

    ###########################################################################
    def self.data=(data) 
      @data = data 
    end

    def self.data 
      @data 
    end

  end
end

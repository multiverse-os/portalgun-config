module Portalgun
  class Portal
    attr_accessor :type
    attr_accessor :storage_path
    attr_reader :hosts

    def initialize(storage_path:nil, type:nil)
      if storage_path.nil?
        @storage_path = "/var/multiverse/portals/"
      else
        @storage_path = storage_path
      end
      @type = :general if @type.nil?
      #Portalgun.paths = Hash.new
      Portalgun.storage_path = @storage_path
      p "RANDOM MAC: " + Portalgun.random.mac
      p "RANDOM NAME:" + Portalgun.random.name
      p "package info: #{Portalgun.os(:debian).packages.games}"
      p "multiverse default packages by class: #{Portalgun.os(:debian).packages.multiverse.app}"
      p "install media : #{Portalgun.install_disk(:debian).iso(:buster)}"
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
    def self.storage_path=(path) 
      @storage_path = path
    end

    def self.storage_path
      @storage_path
    end

  end
end

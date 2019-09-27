module Portalgun
  def self.cache_data
    # TODO
    # Populate these with Go values passed in Ruby marshal form 
    # based on the current status of scramble keys and portalgun
    # cluster setup
    # TODO: Remaining to assign: [@networks]
    @random = Random.new
    @clusters = Hash.new
    @hosts = Hash.new
    @machines = Hash.new 
    @networks = Hash.new
    @disks = Hash.new
    @storage_path = "/var/multiverse/portals/"
    return self
  end

  def self.random 
    @random
  end

  def self.storage_path
    @storage_path
  end 

  def self.storage_path=(path)
    @storage_path 
  end
  

  def self.clusters
    @clusters 
  end

  def self.hosts
    @hosts
  end

  def self.machines 
    @machines 
  end

  def self.disks 
    @disks 
  end

  def self.network
    @networks
  end

  def self.package_manager(os = :debian) 
      PackageManager.new(os)
  end

end

class PackageManager
  attr :os
  attr :packages 

  def initialize(os = :debian)
    @os = :debian
    @packages = Packages.new
  end

  def packages
    @packages
  end
end

class Packages 
  attr :os

  def initialize(os = :debian)
    @os = :debian
  end

  def games 
    if @os == :debian 
      return ["four-in-a-row", "lightsoff"]
    end
  end
end

class Random 
  def mac
    return (1..6).map{"%0.2X"%rand(256)}.join(":")
  end 

  def name 
    adjectives = %w(autumn hidden bitter misty silent empty dry dark summer 
      icy delicate quiet white cool spring winter patient twilight dawn crimson  
      wispy weathered blue billowing broken cold damp falling frosty green long 
      late lingering bold little morning muddy old red rough still small 
      sparkling throbbing shy wandering withered wild black young holy solitary
      fragrant aged snowy proud floral restless divine polished ancient purple
      lively nameless)
    nouns = %w(waterfall river breeze moon rain wind sea morning snow lake 
      sunset pine shadow leaf dawn glitter forest hill cloud meadow sun glade 
      bird brook butterfly bush dew dust field fire flower firefly feather grass
      haze mountain night pond darkness snowflake silence sound sky shape surf 
      thunder violet water wildflower wave water resonance sun wood dream cherry 
      tree fog frost voice paper frog smoke star)  
    return adjectives[rand(63)] + "-" + nouns[rand(63)]
  end
end

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

  def self.install_disk(os = :debian)
    InstallMedia.new(os)
  end

  def self.network
    @networks
  end

  def self.os(os = :debian) 
      PackageManager.new(os)
  end

end

class InstallMedia 
  attr :os 
  def initialize(os = :debian)
    @os = os 
  end

  def iso(release = :buster)
    if @os == :debian 
      if release == :buster
        return "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-mac-10.1.0-amd64-netinst.iso"
      end
    end
  end

  def signature(release = :buster)
    if @os == :debinan 
      if release == :buster
        return "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA256SUMS.sign"
      end
    end
  end

  def checksum(release = :buster)
    if @os == :debian 
      if release == :buster
         return "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA512SUMS"
      end
    end
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

  def multiverse
    MultiversePackages.new(@os)
  end
end

class MultiversePackages 
  attr :os
  def initialize(os = :debian)
    @os = :debian
  end

  def app 
    if @os == :debian
      return ["tor"] 
    end
  end

  def controller 
    if @os == :debian
      return ["tor"] 
    end
  end

  def router 
    if @os == :debian
      return ["tor"] 
    end
  end

  def host 
    if @os == :debian
      return ["tor"] 
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

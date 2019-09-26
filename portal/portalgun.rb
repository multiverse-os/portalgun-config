module Portalgun
  class Portals 
    attr :random
    attr :cluster
    # Output all of a kind
    attr :hosts
    attr :paths
    attr :keys
    attr :networks

    def initialize 
      # TODO
      # Populate these with Go values passed in Ruby marshal form 
      # based on the current status of scramble keys and portalgun
      # cluster setup
      @random = Random.new
      @clusters = Hash.new
      @hosts = Hash.new
      @paths = Hash.new
      @keys = Hash.new
      @networks = Hash.new
    end

    def cluster(name)
      @clusters[name]
    end

    def clusters
      @clusters 
    end

    def host(name)
      @hosts[name]
    end

    def hosts
      @hosts
    end

    def paths 
      @paths
    end 

    def path(name)
      @path[name]
    end

    def keys 
      @keys
    end

    def key(name)
      @keys[name]

    def networks
      @networks
    end

    def network(name)
      @networks[name]
    end

    def random 
      @random
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
end

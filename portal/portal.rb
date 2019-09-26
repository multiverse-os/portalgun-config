module Portalgun
  class Portal
    attr :machine_name
    attr :os
    attr :release

    def self.name=(name)
      @machine_name = name
    end

    def self.name 
      @machine_name 
    end

    def self.configure(&config)
      config.call(self) if block_given?
      return self
    end 

    def self.os(name, &os)
      @os = OperatingSystem.new
      os.call(@os) if block_given?
      @os.name = name
      return @os
    end

    def self.operating_system 
      @os
    end

  end
end


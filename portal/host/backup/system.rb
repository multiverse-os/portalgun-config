module Portalgun
  class Portal
    class Host
      class BackupSystem
        attr_accessor :rate
        attr_accessor :compression
        attr_accessor :archive
        attr_reader :hosts

        def initialize
          @hosts = Array.new
        end

        def add_remote(address:, &remote)
          @host = BackupSystem::Server.new(address: address)
          remote.call(@host) if block_given?
          @hosts += [@host]
          return @host
        end

      end
    end
  end
end

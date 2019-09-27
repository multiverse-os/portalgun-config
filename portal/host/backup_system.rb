module Portalgun
  class Portal
    class Host
      class BackupSystem
        attr_accessor :rate
        attr_accessor :compression
        attr_accessor :archive
        attr_reader :hosts

        def initialize(rate:nil,compression:nil,archive:nil)
          if rate.nil?
            @rate = :weekly
          else 
            @rate = rate
          end
          if compression.nil?
            @compression = :gzip 
          else 
            @compression = compression
          end
          if archive.nil?
            @archive = :tar 
          else 
            @archive = archive 
          end
          @hosts = Array.new
          return self
        end

        ## VALIDATION #########################################################
        def supported_rate(rate)
          return [:hourly, :daily, :weekly, :monthly].include?(rate)0
        end

        ## CONFIG #############################################################
        def add_remote(address:, &remote)
          host = BackupSystem::Server.new(address: address)
          remote.call(host) if block_given?
          @hosts += [host]
          return host
        end
        #######################################################################

      end
    end
  end
end

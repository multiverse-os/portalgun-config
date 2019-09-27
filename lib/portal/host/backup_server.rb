module Portalgun
  class Portal
    class Host
      class BackupSystem
        class Server
          attr_accessor :address
          attr_accessor :protocol
          attr_accessor :duplicates
          attr_accessor :path
          attr :user

          def initialize(address:)
            @address = address 
            @protocol = :ssh if @protocol.nil? 
            @duplicates = 10 if @duplicates.nil?
            @path = "~/" if @path.nil?
            @user = "user" if @user.nil?
            return self
          end
        end
      end
    end
  end
end

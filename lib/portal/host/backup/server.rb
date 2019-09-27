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
          end
        end
      end
    end
  end
end

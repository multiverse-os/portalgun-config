module Portalgun
  class Portal
    class Machine
      class QMP
        attr_accessor :protocol
        attr_accessor :address
        attr_accessor :port
        attr_accessor :allow

        def initialize(protocol:nil,address:nil,port:nil,allow:nil)
          @protocol = protocol 
          @address = address 
          @port = port
          @allow = allow
        end

      end
    end
  end
end

module Portalgun
  class Portal
    class Host
      class Owner
        attr_accessor :name
        attr :keys
        attr :default_user 

        def initialize(name:nil)
          @name = name
          @keys = Array.new
          return self
        end

        ## CONFIG #############################################################
        def add_key(key_type:, path:nil, public_key:nil)
          key = Key.new(key_type: key_type, path: path, public_key: public_key)
          @keys += [key] 
          return key
        end
        #######################################################################
      end
    end
  end
end

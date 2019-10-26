module Portalgun
  class Portal
    class Host
      class Owner
        attr_accessor :type
        attr_accessor :name
        attr :keys
        attr :users

        def initialize(type:nil,name:nil)
          @name = name 
          @type = type
          @keys = Hash.new
          @users = Hash.new
          return self
        end

        ## CONFIG #############################################################
        def add_key(type:,name:,path:nil,public_key:nil)
          @keys[name] = Key.new(type: type, path: path, public_key: public_key)
          return @keys[name]
        end

        def add_user(type:,name:)
          @users[name] = Host::OperatingSystem::User.new(type: type, name: name) 
          return @users[name]
        end
        #######################################################################
      end
    end
  end
end

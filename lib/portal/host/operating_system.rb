module Portalgun
  class Portal
    class Host
      class OperatingSystem
        attr_accessor :name
        attr_accessor :release
        attr :kernel
        attr :package_manager
        attr :users
        attr :networks

        def initialize
          @users = Array.new
          @networks = Array.new
          @kernel = Kernel.new 
          @package_manager = PackageManager.new
        end

        def package_manager(&block)
          block.call(@package_manager) if block_given?
          return @package_manager
        end

        def package_manager=(pm)
          @package_manager = pm 
        end

        def kernel(&block)
          block.call(@kernel) if block_given?
          return @kernel
        end

        def kernel=(kernel)
          @kernel = kernel
        end

        def add_user(name, &user)
          u = User.new
          user.call(u)
          u.name = name
          @users << u
        end

        def add_network(name, &network)
          n = Network.new
          network.call(n)
          n.name = name
          @networks << n
        end

      end
    end
  end
end

module Portalgun
  class Portal
    class OperatingSystem
      attr_accessor :name
      attr_accessor :release
      attr_accessor :package_manager 
      attr_accessor :kernel
      attr_accessor :network
      attr :users
      #attr :firewall 
      #attr_accessor :users
      #attr_accessor :networks

      def initialize
        @users = Array.new
      end

      def add_user(&user)
        u = User.new
        user.call(u)
        @users << u
      end



      def self.user
        @user 
      end

      #def package_manager(&pm)
      #  @pm = OperatingSystem::PackageManager.new
      #  pm.call(@pm)
      #end

      #def kernel(&kernel)
      #  @kernel = OperatingSystem::Kernel.new
      #  kernel.call(@kernel)
      #end

      #def network(&network)
      #  @network = OperatingSystem::Network.new
      #  network.call(@network)
      #end

    end
  end
end

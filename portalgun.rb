require_relative "portal/portal"
require_relative "portal/provisioner"
require_relative "portal/operating_system"
require_relative "portal/package_manager"
require_relative "portal/kernel"
require_relative "portal/network"
require_relative "portal/user"

module Portalgun

  def self.load(file)
    portal = Portalgun::Portal.new
    portal = portal.instance_eval file
    p portal.class
    p "returned values from file instance eval"
    p "portal.name"
    p portal.name
    p "portal.operating_system.name"
    p portal.operating_system.name
    p "portal.operating_system.release"
    p portal.operating_system.release
    p "os.user"
    p portal.operating_system.users.length
    p portal.operating_system.users.first.name
    p portal.operating_system.users.last.name
    p Marshal.dump(portal).unpack("H*")
  end
end

if ARGV.length != 1
  system "echo '[error] portal file must be specified'"
  system "echo ''"
  system "echo '  portalgun [Portal]'"
else
  Portalgun::load(File.read(ARGV[0]))
end

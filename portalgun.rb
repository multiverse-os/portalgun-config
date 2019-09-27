require_relative "portal/portal"
require_relative "portal/helper"
require_relative "portal/host"
require_relative "portal/key"
require_relative "portal/host/owner"
require_relative "portal/host/machine"
require_relative "portal/host/machine/bios"
require_relative "portal/host/machine/cpu"
require_relative "portal/host/machine/emulator"
require_relative "portal/host/machine/device"
require_relative "portal/host/machine/device/input"
require_relative "portal/host/machine/device/network"
require_relative "portal/host/machine/device/sound"
require_relative "portal/host/machine/device/video"
require_relative "portal/host/machine/disk"
require_relative "portal/host/machine/disk/layer"
require_relative "portal/host/machine/disk/filesystem"
require_relative "portal/host/machine/storage"
require_relative "portal/host/backup/system"
require_relative "portal/host/backup/server"
require_relative "portal/host/operating_system"
require_relative "portal/host/operating_system/kernel"
require_relative "portal/host/operating_system/package_manager"
require_relative "portal/host/operating_system/network"
require_relative "portal/host/operating_system/service"
require_relative "portal/host/operating_system/service/ssh"
require_relative "portal/host/operating_system/service/tor"
require_relative "portal/host/operating_system/service/open_vpn"
require_relative "portal/host/operating_system/user"

#
###############################################################################
## TODO
###############################################################################
#
## * Ensure the all initialize functions are setting sane and secure defaults
##   it should work when almost nothing is defined.
#
##
#
##
#
##
#
##

module Portalgun

  def self.load(file)
    Portalgun.cache_data
    portal = Portalgun::Portal.new
    portal = portal.instance_eval file


    p portal.class
    p "returned values from file instance eval"
    p ""
    p "host.vm.portal.name"
    p portal.host(:controller).name
    p "host.vm.portal.operating_system.name"
    p portal.host(:controller).machine.operating_system.name
    p "host.vm.portal.operating_system.release"
    p portal.host(:controller).machine.operating_system.release
    p "host.vm.os.users"
    p portal.host(:controller).machine.operating_system.users.length
    p portal.host(:controller).machine.operating_system.users.first.name
    p portal.host(:controller).machine.operating_system.users.last.name
    p "host.vm.os.pm"
    p "  host.vm.os.pm.install"
    p portal.host(:controller).machine.operating_system.package_manager.install.length 
    p "  host.vm.os.pm.remove"
    p portal.host(:controller).machine.operating_system.package_manager.remove.length 
    p "host.vm.os.kernel"
    p "  host.vm.os.kernel.modules"
    p portal.host(:controller).machine.operating_system.kernel.modules.length
    p "host.vm.os.networks"
    p portal.host(:controller).machine.operating_system.networks.length
    p "host.vm.os.networks.devices"
    p portal.host(:controller).machine.operating_system.networks.first.devices.length 
    p portal.host(:controller).machine.operating_system.networks.first.devices.first.name
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

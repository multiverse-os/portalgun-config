module Portalgun 
  class Portal
    class Machine
      class BIOS
        attr_accessor :name
        attr_accessor :path
        attr_accessor :sign
        attr_accessor :keys

        def initialize
          @keys = Array.new
          @name = :ovmf if @name.nil?
          @path = "/usr/share/OVMF/OVMF_CODE.fd" if @path.nil?
          return self
        end

        ## CONFIG #############################################################
        def add_key(key_type:, path:nil, public_key:nil)
          key = Key.new(key_type: key_type, path: path, public_key: public_key)
          @keys += [key]
          return key
        end
        #####################################################################
      end
    end
  end
end

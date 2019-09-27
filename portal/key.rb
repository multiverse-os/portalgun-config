module Portalgun
  class Key
    attr_accessor :key_type
    attr_accessor :path 
    attr_accessor :public_key

    def initialize(key_type:nil,path:nil,public_key:nil)
      @key_type = key_type 
      @path = path
      @public_key = public_key 
      return self
    end

    ## VALIDATION #############################################################
    def supported_type(type)
      return [:gpg, :ecdsa].include?(type)
    end
    ###########################################################################

  end
end

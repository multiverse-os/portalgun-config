module Portalgun
  class Key
    attr_accessor :type
    attr_accessor :name
    attr_accessor :path 
    attr_accessor :public_key

    def initialize(type:nil,name:nil,path:nil,public_key:nil)
      @type = type 
      @name = name
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

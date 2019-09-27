module Portalgun
  class Portal
    class Host 
      class Machine
        class Storage
          class Disk
            attr_accessor :label
            attr_accessor :size 
            attr_accessor :read_only
            attr_accessor :serial
            attr_accessor :filesystem
            attr_accessor :image_format
            attr_accessor :bus 
            attr_accessor :cache 
            attr_accessor :io_mode  
            attr_accessor :ephemeral 
            attr_accessor :discard
            attr_accessor :detect_zeroes
            attr_accessor :partitions
            attr_accessor :path
            attr_accessor :layers 

            def initialize(label:nil, path:nil)
              if label.nil? 
                @label = "portal-disk-#{rand(9999)}"
              else
                @label = label 
              end
              if path.nil?
                @path = Portalgun.data_path
              else
                @path = path
              end
              @read_only = false if @read_only.nil?
              @filesystem = :ext4 if @filesystem.nil?
              @image_format = :qcow2 if @image_format.nil?
              @bus = :virtio if @bus.nil?
              @cache = :none if @cache.nil?
              @io_mode = :thread if @io_mode.nil?
              @ephemeral = false if @ephemeral.nil?
              @discard = :ignore if @discard.nil?
              @detect_zeroes = false if @detect_zeroes.nil?
              @paritions = Array.new 
              @layers = Array.new 
              return self
            end

          end
        end
      end
    end
  end
end

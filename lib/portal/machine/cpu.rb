
module Portalgun
  class Portal
    class Machine
      class CPU
        attr_accessor :model
        attr_accessor :manufacturer
        attr_accessor :architecture
        attr_accessor :cores
        attr_accessor :sockets
        attr_accessor :threads
        attr_accessor :minimum
        attr_accessor :maximum
        attr_accessor :pinned
        attr_accessor :logical_cpus

        def initialize(model:nil) 
          if model.nil? 
            @model = :passthrough 
          else
            @model = model 
          end
          @minimum = 1 if @minimum.nil?
          @maximum = 2 if @maximum.nil?
          @sockets = 2 if @sockets.nil?
          @cores = 1 if @cores.nil?
          @threads = 1 if @threads.nil?
          @pinned = Array.new
          return self
        end

      end
    end
  end
end

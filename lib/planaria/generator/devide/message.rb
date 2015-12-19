module Planaria::Generator
  module Devide
    class Message
      def initialize(name, base)
        @name = name
        @base = base
      end

      def run
        puts "Devide #{@name} project from #{@base}"
        Planaria::Utils.tree "./#{@name}"
      end
    end
  end
end

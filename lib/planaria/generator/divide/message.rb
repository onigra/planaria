module Planaria::Generator
  module Divide
    class Message
      def initialize(name, base)
        @name = name
        @base = base
      end

      def run
        puts "Divide #{@name} project from #{@base}"
        Planaria::Utils.tree "./#{@name}"
      end
    end
  end
end

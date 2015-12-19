module Planaria::Generator
  module Initializer
    class Message
      def initialize(name)
        @name = name
      end

      def run
        puts "Create #{@name} project"
        Planaria::Utils.tree "./#{@name}"
      end
    end
  end
end

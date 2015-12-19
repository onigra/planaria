module Planaria::Generator
  module Initializer
    class Runner
      def initialize(name)
        @name = name
      end

      def run
        check
        execute
        message
      rescue ::Planaria::StopInitializer
        puts "Stop generate."
      end

      private

      def check
        Checker.new(@name).run
      end

      def execute
        Executer.new(@name).run
      end

      def message
        Message.new(@name).run
      end
    end
  end
end

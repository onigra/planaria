module Planaria::Generator
  module Builder
    class Runner
      def initialize(name)
        @name = name
      end

      def run
        check
        execute
        message
      rescue ::Planaria::BuildProjectNotFound
        puts "#{@name} not found"
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

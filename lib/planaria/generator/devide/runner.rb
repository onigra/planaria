module Planaria::Generator
  module Devide
    class Runner
      def initialize(name, base)
        @name = name
        @base = base
      end

      def run
        check
        execute
        message
      rescue ::Planaria::BaseProjectNotFound
        puts "Base project not found."
      rescue ::Planaria::StopDevide
        puts "Stop devide."
      end

      private

      def check
        Checker.new(@name, @base).run
      end

      def execute
        Executer.new(@name, @base).run
      end

      def message
        Message.new(@name, @base).run
      end
    end
  end
end

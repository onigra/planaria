module Planaria::Generator
  module Divide
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
      rescue ::Planaria::StopDivide
        puts "Stop divide."
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

module Planaria::Generator
  module Builder
    class Runner
      def initialize(name)
        @name = name
      end

      def run
        execute
        message
      end

      private

      def execute
        Executer.new(@name).run
      end

      def message
        Message.new(@name).run
      end
    end
  end
end

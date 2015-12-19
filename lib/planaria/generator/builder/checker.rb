class Planaria::BuildProjectNotFound < StandardError; end

module Planaria::Generator
  module Builder
    class Checker
      def initialize(name)
        @name = name
      end

      def run
        raise ::Planaria::BuildProjectNotFound unless Dir.exist?("./#{@name}")
      end
    end
  end
end

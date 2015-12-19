class Planaria::StopInitializer < StandardError; end

module Planaria::Generator
  module Initializer
    class Checker
      def initialize(name)
        @name = name
      end

      def run
        check if Dir.exist?("./#{@name}")
      end

      private

      def check
        puts "#{@name} directory is already exist. Overwrite? (type Y/n)"
        input = STDIN.gets.chomp

        if input.to_s == "Y"
          FileUtils.rm_rf "./#{@name}"
        else
          raise ::Planaria::StopInitializer
        end
      end
    end
  end
end

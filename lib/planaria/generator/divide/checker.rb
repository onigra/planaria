class Planaria::StopDivide < StandardError; end
class Planaria::BaseProjectNotFound < StandardError; end

module Planaria::Generator
  module Divide
    class Checker
      def initialize(name, base)
        @name = name
        @base = base
      end

      def run
        base_check
        check if Dir.exist?("./#{@name}")
      end

      def base_check
        raise ::Planaria::BaseProjectNotFound unless Dir.exist?("./#{@base}")
      end

      private

      def check
        puts "#{@name} directory is already exist. Overwrite? (type Y/n)"
        input = STDIN.gets.chomp

        if input.to_s == "Y"
          FileUtils.rm_rf "./#{@name}"
        else
          raise ::Planaria::StopDivide
        end
      end
    end
  end
end

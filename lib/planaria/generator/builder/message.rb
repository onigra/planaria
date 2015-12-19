module Planaria::Generator
  module Builder
    class Message
      def initialize(name)
        @executer = Executer.new(name)
      end

      def run
        @executer.yaml_files.each do |file|
          puts "Generate #{yml.split("/").last.split(".").first}.html"
        end
      end
    end
  end
end

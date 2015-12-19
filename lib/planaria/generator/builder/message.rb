module Planaria::Generator
  module Builder
    class Message
      def initialize(name)
        @name = name
        @executer = Executer.new(name)
      end

      def run
        @executer.yaml_files.each do |file|
          puts "Generate #{@name}/#{file.split("/").last.split(".").first}.html"
        end
      end
    end
  end
end

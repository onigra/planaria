module Planaria::Generator
  module Builder
    class Executer
      def initialize(name)
        @name = name
      end

      def run 
        yaml_files.each do |yml|
          erb = ::ERB.new(File.read "./#{@name}/html/index.html.erb")
          file_name = yml.split("/").last.split(".").first
          yaml = ::YAML.load(File.read yml)

          yaml.each do |k, v|
            instance_variable_set("@#{k}", v)
          end

          ::File.open "./#{@name}/#{file_name}.html", "w" do |file|
            file.write erb.result(binding)
          end
        end
      end

      def yaml_files
        Dir.glob "./#{@name}/yamls/*.yml"
      end
    end
  end
end
module Planaria::Generator
  module Builder
    class Executer
      def initialize(name)
        @name = name
      end

      def run 
        yaml_files.each do |yml|
          file_name = yml.split("/").last.split(".").first
          yaml = ::YAML.load(File.read yml)

          yaml.each do |k, v|
            instance_variable_set("@#{k}", v)
          end

          create_directory file_name
          ::File.open "./#{@name}/#{file_name}/index.html", "w" do |file|
            file.write erb.result(binding)
          end
        end
      end

      def yaml_files
        ::Dir.glob "./#{@name}/yamls/*.yml"
      end

      private

      def erb
        ::ERB.new(File.read "./#{@name}/html/index.html.erb")
      end

      def create_directory(file_name)
        FileUtils.mkdir_p "./#{@name}/#{file_name}"
      end
    end
  end
end

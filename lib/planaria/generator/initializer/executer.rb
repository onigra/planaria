module Planaria::Generator
  module Initializer
    class Executer
      def initialize(name)
        @name = name
      end

      def run
        create_directories
        create_files
        write_files
      end

      private

      def mkdir(path)
        FileUtils.mkdir_p("#{path}")
      end

      def create_directories
        mkdir "./#{@name}"
        mkdir "./#{@name}/html"
        mkdir "./#{@name}/css"
        mkdir "./#{@name}/js"
        mkdir "./#{@name}/img"
        mkdir "./#{@name}/yamls"
      end

      def create_files
        FileUtils.touch("./#{@name}/css/#{@name}.css")
        FileUtils.touch("./#{@name}/js/#{@name}.js")
      end

      def write_files
        write_template
        write_yaml
      end

      def write_template
        ::File.open "./#{@name}/html/index.html.erb", "w" do |file|
          file.write(::Planaria::Templates::Html.index @name)
        end
      end

      def write_yaml
        ::File.open "./#{@name}/yamls/base.yml", "w" do |file|
          file.write(::Planaria::Templates::Yaml.default @name)
        end
      end
    end
  end
end

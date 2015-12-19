module Planaria::Generator
  module Devide
    class Executer
      include ::Planaria::Utils

      def initialize(name, base)
        @name = name
        @base = base
      end

      def run
        create_directories
        copy_static_files
        copy_yamls
      end

      private

      def copy_static_files
        FileUtils.copy_file("./#{@base}/html/index.html.erb", "./#{@name}/html/index.html.erb")
        FileUtils.copy_file("./#{@base}/css/#{@base}.css","./#{@name}/css/#{@name}.css")
        FileUtils.copy_file("./#{@base}/js/#{@base}.js", "./#{@name}/js/#{@name}.js")
      end

      def copy_yamls
        FileUtils.cp(Dir.glob("./#{@base}/yamls/*.yml"), "./#{@name}/yamls/")
      end
    end
  end
end

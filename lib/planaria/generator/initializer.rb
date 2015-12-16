module Planaria::Generator
  class Initializer
    def initialize(name)
      @name = name
    end

    def run
      create_directories
      create_files
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
    end

    def create_files
      FileUtils.touch("./#{@name}/config.yml")
      FileUtils.touch("./#{@name}/css/#{@name}.css")
      FileUtils.touch("./#{@name}/js/#{@name}.js")

      ::File.open "./#{@name}/html/index.html.erb", "w" do |file|
        file.write ::Planaria::Templates::Html.index
      end
    end
  end
end

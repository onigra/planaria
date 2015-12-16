module Planaria::Generator
  class Initializer
    def initialize(name)
      @name = name
    end

    def run
      mkdir "./#{@name}"
      mkdir "./#{@name}/html"
      mkdir "./#{@name}/css"
      mkdir "./#{@name}/js"
      FileUtils.touch("./#{@name}/html/index.html.erb")
      FileUtils.touch("./#{@name}/config.yml")
    end

    private

    def mkdir(path)
      FileUtils.mkdir_p("#{path}")
    end
  end
end

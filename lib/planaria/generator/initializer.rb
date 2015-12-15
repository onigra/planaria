module Planaria::Generator
  class Initializer
    def initialize(name)
      @name = name
    end

    def run
      mkdir "./projects/#{@name}"
      mkdir "./projects/#{@name}/html"
      mkdir "./projects/#{@name}/css"
      mkdir "./projects/#{@name}/js"
      FileUtils.touch("./projects/#{@name}/html/index.html.erb")
      FileUtils.touch("./projects/#{@name}/config.yml")
    end

    private

    def mkdir(path)
      FileUtils.mkdir_p("#{path}")
    end
  end
end

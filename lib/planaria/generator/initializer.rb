module Planaria::Generator
  class Initializer
    def initialize(name)
      @name = name
    end

    def run
      mkdir "./templates/#{@name}"
      mkdir "./templates/#{@name}/html"
      mkdir "./templates/#{@name}/css"
      mkdir "./templates/#{@name}/js"
      FileUtils.touch("./templates/#{@name}/html/index.html.erb")
      FileUtils.touch("./templates/#{@name}/config.yml")
    end

    private

    def mkdir(path)
      FileUtils.mkdir_p("#{path}")
    end
  end
end

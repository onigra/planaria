module Planaria::Generator
  class Builder
    def initialize(name)
      @name = name
    end

    def run 
      erb = ::ERB.new(File.read "./templates/#{@name}/html/index.html.erb")
      yaml = ::YAML.load(File.read "./templates/#{@name}/config.yml")
      
      yaml.each do |k, v|
        instance_variable_set("@#{k}", v)
      end
      
      ::File.open "templates/#{@name}/index.html", "w" do |file|
        file.write erb.result(binding)
      end
    end
  end
end

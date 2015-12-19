module Planaria
  class CLI < Thor

    desc "init", "Create new template directories"
    option :name, type: :string, aliases: '-n', required: true
    def init
      Generator::Initializer::Runner.new(options[:name]).run
    end

    desc "build", "Create template"
    option :name, type: :string, aliases: '-n', required: true
    def build
      Generator::Builder::Runner.new(options[:name]).run
    end

    desc "divide", "Divide project"
    option :name, type: :string, aliases: '-n', required: true
    option :base, type: :string, aliases: '-b', required: true
    def divide
      Generator::Divide::Runner.new(options[:name], options[:base]).run
    end
  end
end

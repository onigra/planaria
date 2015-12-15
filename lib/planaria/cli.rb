module Planaria
  class CLI < Thor

    desc "init", "Create new template directories."
    option :name, type: :string, aliases: '-n', required: true
    def init
      Generator::Initializer.new(options[:name]).run
    end

    desc "build", "Create template."
    option :name, type: :string, aliases: '-n', required: true
    def build
      Generator::Builder.new(options[:name]).run
    end
  end
end

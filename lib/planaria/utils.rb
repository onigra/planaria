module Planaria
  module Utils
    def self.tree(path, pre = nil)
      unless pre 
        puts path
        pre = "   "
      end

      directories = Dir.entries(path).reject { |d| d == "." or d == ".." }.sort

      directories.each do |dir|
        last = dir if dir == directories.last

        if FileTest.directory?(File.join(path, dir))
          path_dir = File.join(path, dir)
          puts "#{pre}+--#{dir}"
          tree path_dir, pre + (last ? "   " : "|   ")
        else
          puts pre + (last ? "`" : "|") + "--" + dir
        end
      end
    end

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
  end
end

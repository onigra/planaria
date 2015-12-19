module Planaria
  class Utils
    def self.tree(path, pre = nil)
      unless pre 
        puts path
        pre = "   "
      end

      directories = Dir.entries(path).reject { |d| d == "." or d == ".." }

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
  end
end

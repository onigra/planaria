module Planaria::Templates
  class Yaml
    def self.default(name)
      <<-EOS
title: #{name}
      EOS
    end
  end
end

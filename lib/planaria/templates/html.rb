module Planaria::Templates
  class Html
    def self.index
      <<-'EOS'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">  
    <title>FIXME</title>
    <link rel="stylesheet" type="text/css" media="screen" href=<%= "\"css/#{@name}.css\""%> >
    <script type="text/javascript" src=<%= "\"js/#{@name}.js\""%> ></script>
  </head>

  <body>
    <h1>FIXME</h1>
  </body>

  <footer>
  </footer>
</html>
      EOS
    end
  end
end

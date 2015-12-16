require File.expand_path(File.join('../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder do
  describe "#run" do
    context "only base.yml" do
      let(:project_name) { "foobar" }
      let(:assert_html) do
        <<-EOS
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#{project_name}</title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/#{project_name}.css" >
    <script type="text/javascript" src="js/#{project_name}.js" ></script>
  </head>

  <body>
    <h1>FIXME</h1>
  </body>

  <footer>
  </footer>
</html>
        EOS
      end

      before do
        Planaria::Generator::Initializer.new(project_name).run
        Planaria::Generator::Builder.new(project_name).run
      end

      after { FileUtils.remove_dir "#{APP_ROOT}/#{project_name}", force: true }

      it { expect(File.read "#{APP_ROOT}/#{project_name}/base.html").to eq assert_html }
    end

    context "en.yml, ja.yml" do
    end
  end
end

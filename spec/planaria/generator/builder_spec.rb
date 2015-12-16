require File.expand_path(File.join('../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder do
  describe "#run" do
    let(:assert_html) do
      <<-EOS
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SampleProject</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>

  <body>
    <header role="banner">
      <h1>SampleProject</h1>
    </header>

    <div class="wrap">
      <main role="main">

      </main>
    </div>

    <footer role="contentinfo">
      <small>Copyright &copy; <time datetime="2015">2015</time></small>
    </footer>
  </body>
</html>
      EOS
    end

    let(:project_name) { "foobar" }

    before do
      Planaria::Generator::Initializer.new(project_name).run
      FileUtils.cp("#{APP_ROOT}/sample/index.html.erb", "#{APP_ROOT}/#{project_name}/html/index.html.erb")
      FileUtils.cp("#{APP_ROOT}/sample/config.yml", "#{APP_ROOT}/#{project_name}/config.yml")
      Planaria::Generator::Builder.new(project_name).run
    end

    after { FileUtils.remove_dir "#{APP_ROOT}/#{project_name}", force: true }

    it { expect(File.read "#{APP_ROOT}/#{project_name}/index.html").to eq assert_html }
  end
end

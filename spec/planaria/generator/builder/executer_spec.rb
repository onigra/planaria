require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder::Executer do
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
        Planaria::Generator::Initializer::Executer.new(project_name).run
        described_class.new(project_name).run
      end

      after { FileUtils.remove_dir "#{APP_ROOT}/#{project_name}", force: true }

      it { expect(File.read "#{APP_ROOT}/#{project_name}/base/index.html").to eq assert_html }
    end

    context "en.yml, ja.yml" do
      let(:project_name) { "i18n" }
      let(:en_name) { "en" }
      let(:ja_name) { "ja" }

      let(:en_html) do
        <<-EOS
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#{en_name}</title>
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

      let(:ja_html) do
        <<-EOS
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>#{ja_name}</title>
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
        Planaria::Generator::Initializer::Executer.new(project_name).run
        FileUtils.rm("#{APP_ROOT}/#{project_name}/yamls/base.yml")

        File.open "#{APP_ROOT}/#{project_name}/yamls/en.yml", "w" do |file|
          file.write "title: #{en_name}"
        end

        File.open "#{APP_ROOT}/#{project_name}/yamls/ja.yml", "w" do |file|
          file.write "title: #{ja_name}"
        end

        described_class.new(project_name).run
      end

      after { FileUtils.remove_dir "#{APP_ROOT}/#{project_name}", force: true }

      it "exists two files" do
        aggregate_failures do
          expect(File.exist?("#{APP_ROOT}/#{project_name}/en/index.html")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name}/ja/index.html")).to be_truthy
        end
      end

      it "title is different" do
        aggregate_failures do
          expect(File.read "#{APP_ROOT}/#{project_name}/ja/index.html").to eq ja_html
          expect(File.read "#{APP_ROOT}/#{project_name}/en/index.html").to eq en_html
        end
      end
    end
  end
end

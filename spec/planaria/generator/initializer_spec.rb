require File.expand_path(File.join('../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Initializer  do
  describe "#run" do
    context "run at once" do
      let(:project_name) { "foobar" }
      let(:initializer) { described_class.new project_name }

      before { initializer.run }
      after { FileUtils.remove_dir "#{APP_ROOT}/#{project_name}", force: true }

      it do
        aggregate_failures do
          expect(Dir.exist?("#{APP_ROOT}/#{project_name}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name}/js")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name}/img")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name}/yamls")).to be_truthy

          expect(File.exist?("#{APP_ROOT}/#{project_name}/yamls/base.yml")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name}/css/#{project_name}.css")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name}/js/#{project_name}.js")).to be_truthy

          expect(File.read "#{APP_ROOT}/#{project_name}/html/index.html.erb").to eq ::Planaria::Templates::Html.index(project_name)
          expect(File.read "#{APP_ROOT}/#{project_name}/yamls/base.yml").to eq ::Planaria::Templates::Yaml.default(project_name)
        end
      end
    end

    context "run twice" do
      let(:project_name1) { "project_name1" }
      let(:project_name2) { "project_name2" }

      before do
        described_class.new(project_name1).run
        described_class.new(project_name2).run
      end

      after do
        FileUtils.remove_dir "#{APP_ROOT}/#{project_name1}", force: true
        FileUtils.remove_dir "#{APP_ROOT}/#{project_name2}", force: true
      end

      it do
        aggregate_failures do
          expect(Dir.exist?("#{APP_ROOT}/#{project_name1}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name1}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name1}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name1}/js")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name1}/img")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name1}/yamls")).to be_truthy

          expect(File.exist?("#{APP_ROOT}/#{project_name1}/yamls/base.yml")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name1}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name1}/css/#{project_name1}.css")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name1}/js/#{project_name1}.js")).to be_truthy

          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/js")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/img")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/yamls")).to be_truthy

          expect(File.exist?("#{APP_ROOT}/#{project_name2}/yamls/base.yml")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name2}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name2}/css/#{project_name2}.css")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name2}/js/#{project_name2}.js")).to be_truthy
        end
      end
    end
  end
end

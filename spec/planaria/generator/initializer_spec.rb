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
          expect(File.exist?("#{APP_ROOT}/#{project_name}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name}/config.yml")).to be_truthy
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
          expect(File.exist?("#{APP_ROOT}/#{project_name1}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name1}/config.yml")).to be_truthy

          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/#{project_name2}/js")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name2}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/#{project_name2}/config.yml")).to be_truthy
        end
      end
    end
  end
end
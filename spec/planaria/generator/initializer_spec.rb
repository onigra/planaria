require File.expand_path(File.join('../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Initializer  do
  after { FileUtils.remove_dir "#{APP_ROOT}/projects", force: true }

  describe "#run" do
    context "run at once" do
      let(:project_name) { "sample" }
      let(:initializer) { described_class.new project_name }

      before { initializer.run }

      it do
        aggregate_failures do
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name}/js")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/projects/#{project_name}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/projects/#{project_name}/config.yml")).to be_truthy
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

      it do
        aggregate_failures do
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name1}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name1}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name1}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name1}/js")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/projects/#{project_name1}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/projects/#{project_name1}/config.yml")).to be_truthy

          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name2}")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name2}/html")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name2}/css")).to be_truthy
          expect(Dir.exist?("#{APP_ROOT}/projects/#{project_name2}/js")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/projects/#{project_name2}/html/index.html.erb")).to be_truthy
          expect(File.exist?("#{APP_ROOT}/projects/#{project_name2}/config.yml")).to be_truthy
        end
      end
    end
  end
end

require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Divide::Executer do
  let(:base) { "base" }
  let(:new) { "new" }

  before do
    Planaria::Generator::Initializer::Executer.new(base).run
    FileUtils.cp("#{APP_ROOT}/#{base}/yamls/base.yml", "#{APP_ROOT}/#{base}/yamls/en.yml")
    FileUtils.cp("#{APP_ROOT}/#{base}/yamls/base.yml", "#{APP_ROOT}/#{base}/yamls/ja.yml")
  end

  after do
    FileUtils.rm_rf "#{APP_ROOT}/#{base}"
    FileUtils.rm_rf "#{APP_ROOT}/#{new}"
  end

  describe "#run" do
    before { described_class.new(new, base).run }

    it do
      aggregate_failures do
        expect(Dir.exist?("#{APP_ROOT}/#{new}")).to be_truthy
        expect(Dir.exist?("#{APP_ROOT}/#{new}/html")).to be_truthy
        expect(Dir.exist?("#{APP_ROOT}/#{new}/css")).to be_truthy
        expect(Dir.exist?("#{APP_ROOT}/#{new}/js")).to be_truthy
        expect(Dir.exist?("#{APP_ROOT}/#{new}/img")).to be_truthy
        expect(Dir.exist?("#{APP_ROOT}/#{new}/yamls")).to be_truthy

        expect(File.exist?("#{APP_ROOT}/#{new}/yamls/base.yml")).to be_truthy
        expect(File.exist?("#{APP_ROOT}/#{new}/yamls/en.yml")).to be_truthy
        expect(File.exist?("#{APP_ROOT}/#{new}/yamls/ja.yml")).to be_truthy
        expect(File.exist?("#{APP_ROOT}/#{new}/html/index.html.erb")).to be_truthy
        expect(File.exist?("#{APP_ROOT}/#{new}/css/#{new}.css")).to be_truthy
        expect(File.exist?("#{APP_ROOT}/#{new}/js/#{new}.js")).to be_truthy
      end
    end
  end
end

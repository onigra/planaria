require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Devide::Runner do
  let(:base) { "base" }
  let(:new) { "new" }

  describe "#run" do
    context "directory is nothing" do
      before do
        Planaria::Generator::Initializer::Executer.new(base).run
        FileUtils.cp("#{APP_ROOT}/#{base}/yamls/base.yml", "#{APP_ROOT}/#{base}/yamls/en.yml")
      end

      after do
        FileUtils.rm_rf "#{APP_ROOT}/#{base}"
        FileUtils.rm_rf "#{APP_ROOT}/#{new}"
      end

      before { described_class.new(new, base).run }
      it { expect(Dir.exist?("#{APP_ROOT}/#{new}")).to be_truthy }
    end

    context "base directory is nothing" do
      let(:message) { "Base project not found.\n" }
      it { expect { described_class.new(new, base).run }.to output(message).to_stdout }
    end

    context "directory already exists" do
      let(:message) do
        <<-EOS
#{new} directory is already exist. Overwrite? (type Y/n)
Stop devide.
        EOS
      end

      before do
        Planaria::Generator::Initializer::Executer.new(base).run
        FileUtils.cp("#{APP_ROOT}/#{base}/yamls/base.yml", "#{APP_ROOT}/#{base}/yamls/en.yml")
        FileUtils.mkdir "#{APP_ROOT}/#{new}"
        allow(STDIN).to receive(:gets) { "n" }
      end

      after do
        FileUtils.rm_rf "#{APP_ROOT}/#{base}"
        FileUtils.rm_rf "#{APP_ROOT}/#{new}"
      end

      it do
        expect { described_class.new(new, base).run }.to output(message).to_stdout
        expect(Dir.exist?("#{APP_ROOT}/#{new}")).to be_truthy
      end
    end
  end
end

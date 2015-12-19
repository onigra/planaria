require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Initializer::Runner do
  let(:project) { "project" }

  after { FileUtils.rm_rf "#{APP_ROOT}/#{project}" }

  describe "#run" do
    context "directory is nothing" do
      before { described_class.new(project).run }
      it { expect(Dir.exist?("#{APP_ROOT}/#{project}")).to be_truthy }
    end

    context "directory already exists" do
      let(:message) do
        <<-EOS
#{project} directory is already exist. Overwrite? (type Y/n)
Stop generate.
        EOS
      end

      before do
        FileUtils.mkdir "#{APP_ROOT}/#{project}"
        allow(STDIN).to receive(:gets) { "n" }
      end

      it do
        expect { described_class.new(project).run }.to output(message).to_stdout
        expect(Dir.exist?("#{APP_ROOT}/#{project}")).to be_truthy
      end
    end
  end
end

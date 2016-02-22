require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder::Runner do
  let(:project) { "project" }

  describe "#run" do
    context "build project exist" do
      before { Planaria::Generator::Initializer::Executer.new(project).run }
      after { FileUtils.rm_rf "#{APP_ROOT}/#{project}" }

      let(:message) do
        <<-EOS
Generate #{project}/base.html
        EOS
      end

      it do
        expect { described_class.new(project).run }.to output(message).to_stdout
        expect(File.exist?("#{APP_ROOT}/#{project}/base/index.html")).to be_truthy
      end
    end

    context "build project not exist" do
      let(:message) { "#{project} not found\n" }
      it { expect { described_class.new(project).run }.to output(message).to_stdout }
    end
  end
end

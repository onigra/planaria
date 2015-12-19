require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder::Message do
  let(:project) { "project" }
  describe "#run" do
    let(:message) do
      <<-EOS
Generate #{project}/cn.html
Generate #{project}/en.html
Generate #{project}/ja.html
      EOS
    end

    before do
      allow_any_instance_of(Planaria::Generator::Builder::Executer).to receive(:yaml_files)
        .and_return(["./#{project}/yamls/en.yml", "./#{project}/yamls/ja.yml", "./#{project}/yamls/cn.yml"].sort)
    end

    it { expect { described_class.new(project).run }.to output(message).to_stdout }
  end
end

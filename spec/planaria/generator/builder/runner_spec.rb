require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder::Runner do
  let(:project) { "project" }
  before { Planaria::Generator::Initializer::Executer.new(project).run }
  after { FileUtils.rm_rf "#{APP_ROOT}/#{project}" }

  describe "#run" do
    let(:message) do
      <<-EOS
Generate #{project}/base.html
      EOS
    end

    it do
      expect { described_class.new(project).run }.to output(message).to_stdout
      expect(File.exist?("#{APP_ROOT}/#{project}/base.html")).to be_truthy
    end
  end
end

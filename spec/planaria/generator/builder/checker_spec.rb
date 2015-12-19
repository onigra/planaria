require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Builder::Checker do
  describe "#run" do
    it { expect { described_class.new("project").run }.to raise_error Planaria::BuildProjectNotFound }
  end
end

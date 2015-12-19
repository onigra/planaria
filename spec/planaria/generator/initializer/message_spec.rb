require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Initializer::Message do
  let(:project) { "project" }

  before { FileUtils.mkdir "#{APP_ROOT}/#{project}" }
  after { FileUtils.rm_rf "#{APP_ROOT}/#{project}" }

  describe "#run" do
    let(:message) do
      <<-EOS
Create #{project} project
./project
      EOS
    end

    it { expect { described_class.new(project).run }.to output(message).to_stdout }
  end
end

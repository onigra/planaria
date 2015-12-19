require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Divide::Message do
  let(:base) { "base" }
  let(:new) { "new" }

  before { FileUtils.mkdir "#{APP_ROOT}/#{new}" }
  after { FileUtils.rm_rf "#{APP_ROOT}/#{new}" }

  describe "#run" do
    before { described_class.new(new, base).run }

    let(:message) do
      <<-EOS
Divide #{new} project from #{base}
./new
      EOS
    end

    it { expect { described_class.new(new, base).run }.to output(message).to_stdout }
  end
end

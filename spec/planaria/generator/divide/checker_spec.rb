require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Divide::Checker do
  let(:base) { "base" }
  let(:new) { "new" }

  describe "#base_check" do
    it "raise Planaria::BaseProjectNotFound" do
      expect { described_class.new(new, base).base_check }.to raise_error Planaria::BaseProjectNotFound
    end
  end

  describe "#run" do
    before do
      Planaria::Generator::Initializer::Executer.new(base).run
      Planaria::Generator::Initializer::Executer.new(new).run
    end

    after do
      FileUtils.rm_rf "#{APP_ROOT}/#{base}"
      FileUtils.rm_rf "#{APP_ROOT}/#{new}"
    end

    context "input Y" do
      before { allow(STDIN).to receive(:gets) { "Y" } }

      it "directory was remove" do
        described_class.new(new, base).run
        expect(Dir.exist?("#{APP_ROOT}/#{new}")).to be_falsy
      end
    end

    context "input n" do
      before { allow(STDIN).to receive(:gets) { "n" } }

      it "raise Planaria::StopDivide" do
        expect { described_class.new(new, base).run }.to raise_error Planaria::StopDivide
      end

      it "directory was not remove" do
        expect(Dir.exist?("#{APP_ROOT}/#{new}")).to be_truthy
      end
    end
  end
end

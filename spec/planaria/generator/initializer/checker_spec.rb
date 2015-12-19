require File.expand_path(File.join('../../../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Generator::Initializer::Checker do
  let(:project) { "project" }

  describe "#run" do
    context "directory is nothing" do
      it "nothing happens" do
        described_class.new(project).run
        expect(Dir.exist?("#{APP_ROOT}/#{project}")).to be_falsy
      end
    end

    context "directory already exists" do
      before { FileUtils.mkdir "#{APP_ROOT}/#{project}" }
      after { FileUtils.rm_rf "#{APP_ROOT}/#{project}" }

      context "input Y" do
        before { allow(STDIN).to receive(:gets) { "Y" } }

        it "directory was remove" do
          described_class.new(project).run
          expect(Dir.exist?("#{APP_ROOT}/#{project}")).to be_falsy
        end
      end

      context "input n" do
        before { allow(STDIN).to receive(:gets) { "n" } }

        it "raise Planaria::StopInitializer" do
          expect { described_class.new(project).run }.to raise_error Planaria::StopInitializer
        end

        it "directory was not remove" do
          expect(Dir.exist?("#{APP_ROOT}/#{project}")).to be_truthy
        end
      end
    end
  end
end

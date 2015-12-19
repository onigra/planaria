require File.expand_path(File.join('../', 'spec_helper'), File.dirname(__FILE__))

RSpec.describe Planaria::Utils do
  let(:project) { "project" }
  after { FileUtils.rm_rf "#{APP_ROOT}/#{project}" }

  describe ".tree" do

    let(:result) do
      <<-EOS
./#{project}
   +--css
   |   `--#{project}.css
   +--html
   |   `--index.html.erb
   +--img
   +--js
   |   `--#{project}.js
   +--yamls
      `--base.yml
      EOS
    end

    before { Planaria::Generator::Initializer::Executer.new(project).run }
    it { expect { described_class.tree "./#{project}" }.to output(result).to_stdout }
  end
end

require 'spec_helper'

describe T1k::Commands::Ship do
  describe '#self.run' do

    it "should checkout to master" do

      [
        "git checkout master",
        "git pull --rebase",
        "git merge branch_name",
        "git commit -v",
        "git push origin master"
      ].each do |cmd|
        allow_any_instance_of(Kernel).to receive(:system).with( cmd )
      end

      T1k::Commands::Ship.run
    end
  end
end

require 'spec_helper'

describe T1k::Commands::Ship do
  describe '#self.run' do

    context "when default_remote_branch is :master" do
      before do
        T1k.setup do |config|
          config.repository.default_remote_branch = :master
        end
      end

      it "should checkout to master" do
        [ "git checkout master",
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

    context "when default_remote_branch is :branch" do
      before do
        T1k.setup do |config|
          config.repository.default_remote_branch = :branch
        end
      end

      it "should checkout to branch_name" do
        [ "git checkout branch_name",
          "git pull --rebase branch_name",
          "git commit -v",
          "git push origin branch_name"
        ].each do |cmd|
          allow_any_instance_of(Kernel).to receive(:system).with( cmd )
        end

        T1k::Commands::Ship.run
      end
    end
  end
end

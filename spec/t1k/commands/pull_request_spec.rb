require 'spec_helper'

describe T1k::Commands::PullRequest do
  subject { T1k::Commands::PullRequest }

  context '#run' do
    before do
      T1k.setup do |config|
        config.repository.default_remote_branch = :master
        config.repository.adapter = :bitbucket
      end
    end
    it 'have to sink' do
      expect(T1k::Commands::Sink).to receive(:run)

      subject.run
    end

    it 'have to push code to new branch' do
        [
          "git checkout master",
          "git pull --rebase origin master",
          "git checkout branch_name",
          "git rebase master"
        ].each do |cmd|
          allow_any_instance_of(Kernel).to receive(:system).with( cmd )
         end

      subject.run
    end
  end
end

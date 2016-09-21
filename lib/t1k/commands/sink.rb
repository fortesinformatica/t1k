module T1k
  module Commands
    class Sink
      def self.run
        T1k.setup_credentials
        branch = T1k::Commands::Branch.actual_branch
        self.rebasing(branch)
      end

      def self.rebasing(branch)
        [
          "git checkout master",
          "git pull --rebase origin master",

          "git checkout #{branch}",
          "git pull --rebase origin #{branch}",

          "git rebase master"
        ].each do |cmd|
          system cmd
        end
      end
    end
  end
end

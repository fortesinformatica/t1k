module T1k
  module Commands
    class Sink
      def self.run
        branch = T1k::Commands::Branch.actual_branch

        [
          "git checkout master",
          "git pull --rebase origin master",
          "git checkout #{branch.strip}",
          "git rebase master #{branch.strip}"
        ].each do |cmd|
           system cmd
         end
      end
    end
  end
end

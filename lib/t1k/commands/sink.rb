module T1k
  module Commands
    class Sink
      def self.run
        default_remote_branch = T1k::Repository.default_remote_branch

        branch = T1k::Commands::Branch.actual_branch

        if default_remote_branch == :master
          [
            "git checkout master",
            "git pull --rebase origin master",
            "git checkout #{branch.strip}",
            "git rebase master #{branch.strip}"
          ].each do |cmd|
             system cmd
           end

         elsif default_remote_branch == :branch
           [
             "git checkout #{branch}",
             "git pull --rebase",
           ].each do |cmd|
              system cmd
            end
         end

      end
    end
  end
end

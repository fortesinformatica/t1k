  module T1k
    module Commands
      class Ship

        def self.run
          default_remote_branch = T1k::Repository.default_remote_branch

          branch = T1k::Commands::Branch.actual_branch.strip

          if default_remote_branch == :master
            [
              "git checkout master",
              "git pull --rebase",
              "git merge #{branch}",
              "git commit -v",
              "git push origin master"
            ].each do |cmd|
               system cmd
             end

         elsif default_remote_branch == :branch
             [
               "git checkout #{branch}",
               "git pull --rebase",
               "git commit -v",
               "git push origin #{branch}"
             ].each do |cmd|
                system cmd
              end
        end
      end
    end
  end
end

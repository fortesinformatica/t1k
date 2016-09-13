module T1k
  module Commands
    class Ship

      def self.run
        T1k.setup_credentials

        default_remote_branch = T1k::Repository.default_remote_branch
        branch                = T1k::Commands::Branch.actual_branch.strip

        if default_remote_branch == :master
          commands_if_master(branch)
        elsif default_remote_branch == :branch
          commands_if_branch(branch)
        else
          puts "Invalid default_remote_branch"
        end
      end

      def self.commands_if_master(branch)
        [ "git checkout master",
          "git pull --rebase",
          "git merge #{branch}",
          "git commit -v",
          "git push origin master"
        ].each do |cmd|
          system cmd
        end
      end

      def self.commands_if_branch(branch)
        [ "git checkout #{branch}",
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

module T1k
  module Commands
    class Sink
      def self.run
        T1k.setup_credentials

        default_remote_branch = T1k::Repository.default_remote_branch
        branch                = T1k::Commands::Branch.actual_branch

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
          "git pull --rebase origin master",
          "git checkout #{branch.strip}",
          "git rebase master"
        ].each do |cmd|
          system cmd
        end
      end

      def self.commands_if_branch(branch)
        [ "git checkout #{branch}",
          "git pull --rebase origin#{branch}",
        ].each do |cmd|
          system cmd
        end
      end
    end
  end
end

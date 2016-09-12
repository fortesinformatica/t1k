module T1k
  module Commands
    class Ship

      def self.run

        T1k::Commands::Validate.ability_to_push_on_master
        branch = T1k::Commands::Branch.actual_branch

        [
          "git checkout master",
          "git pull --rebase",
          "git merge #{branch.strip}",
          "git commit -v",
          "git push origin master"
        ].each do |cmd|
           system cmd
         end
      end
    end
  end
end

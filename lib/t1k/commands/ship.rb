

module T1k
  module Commands
    class Ship

      def self.run
      branch = `git branch | grep '*' | awk '{print $2}'`
      system "git checkout master"
      system "git pull --rebase"
      system "git merge #{branch.strip}"
      system "git commit -v"
      system "git push origin master"
      end

      def self.help
        <<-DESC
        ship - delivery your changes to local and remote master branch.
        DESC
      end
    end
  end
end
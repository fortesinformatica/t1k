module T1k
  module Commands
    class Sink
      def self.run
        branch = `git branch | grep '*' | awk '{print $2}'`
        system "git checkout master"
        system "git pull --rebase origin master"
        system "git checkout #{branch.strip}"
        system "git rebase master #{branch.strip}"
      end
    end
  end
end
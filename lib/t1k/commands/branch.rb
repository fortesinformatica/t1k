module T1k
  module Commands
    class Branch
      def self.actual_branch
        branch = `git branch | grep '*' | awk '{print $2}'`

        branch
      end
    end
  end
end

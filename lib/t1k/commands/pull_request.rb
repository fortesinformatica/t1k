module T1k
  module Commands
    class PullRequest

      def self.run
        T1k::Commands::Sink.run

        branch = T1k::Commands::Branch.actual_branch
        pull   = `git push origin #{branch.strip}`
        self.open_browser pull
      end

      def self.open_browser pull
        return 1 if pull.nil?
        match = pull.match( /(https:\/\/[a-zA-Z].*=1)/)
        if match
          uri = match[0]  
          system "open #{uri}"
        end
      end
    end
  end
end

module T1k
  module Commands
    class PullRequest

      def self.run(dest_branch)
        dest_branch ||= 'master'
        T1k::Commands::Sink.run

        branch = T1k::Commands::Branch.actual_branch
        pull   = `git push origin #{branch.strip}`
        self.open_browser pull, dest_branch
      end

      def self.open_browser pull, dest_branch
        return 1 if pull.nil?
        match = pull.match( /(https:\/\/[a-zA-Z].*=1)/)
        if match
          uri = match[0]
          system "open #{uri}?dest=#{dest_branch}"
        end
      end
    end
  end
end

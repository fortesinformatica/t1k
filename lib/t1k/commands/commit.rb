module T1k
  module Commands
    class Commit

      def self.run(message, close)
        branch = `git branch | grep '*' | awk '{print $2}'`
        system "git commit -m '[#{close ? 'close' : ''} ##{branch.strip}] #{message.present?? message : ''}'"
      end
    end
  end
end
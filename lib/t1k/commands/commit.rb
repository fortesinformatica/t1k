module T1k
  module Commands
    class Commit

      def self.run(message, close, add, no_message)
        message ||= ""

        raise "Message can't be blank. Use --no-message to ignore this rule." if message.empty? && !no_message
        branch = `git branch | grep '*' | awk '{print $2}'`
        text_close = close ? 'close ' : ''
        text_add = add ? 'a' : ''
        system "git commit -#{text_add}m '[#{text_close}##{branch.strip}] #{message.present?? message : ''}'"
      end
    end
  end
end

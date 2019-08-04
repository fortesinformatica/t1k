module T1k
  module Commands
    class Commit

      def self.run(message, close, add, no_message)
        T1k.setup_credentials
        message ||= ""
        text_close = ''

        raise "Message can't be blank. Use --no-message to ignore this rule." if message.empty? && !no_message
        branch = T1k::Commands::Branch.actual_branch.gsub("CARD","")

        text_close = close ? 'close' : T1k::Repository.ref_message

        text_add = add ? 'a' : ''

        system "git commit -#{text_add}m '[#{text_close}##{branch.strip}] #{message}'"
      end
    end
  end
end

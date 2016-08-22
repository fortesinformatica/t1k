module T1k
  module Commands
    class Commit

      def self.run(message, close, add, no_message)
        message ||= ""
        skip_ci = ''
        text_close = ''

        raise "Message can't be blank. Use --no-message to ignore this rule." if message.empty? && !no_message
        branch = `git branch | grep '*' | awk '{print $2}'`

        text_close = close ? 'close ' : ''

        if close
          text_close = 'close '
        else
          skip_ci    = '[ci skip]'
        end

        text_add = add ? 'a' : ''

        system "git commit -#{text_add}m '[#{text_close}##{branch.strip}] #{message} #{skip_ci}' "
      end
    end
  end
end

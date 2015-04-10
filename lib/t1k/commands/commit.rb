module T1k
  module Commands
    class Commit

      def self.run(args)
        message, close = parse_args(args)

        branch = `git branch | grep '*' | awk '{print $2}'`
        system "git commit -m '[#{close} ##{branch.strip}] #{message}'"
      end

      def self.help
        <<-DESC
        commit - commit your staged changes.

          -m <message>  - send a commit with a custom message
          -c            - send a commit with close sentence. eg. [closes #320]
        DESC
      end

      private

      def self.parse_args(args)
        message = ""
        close = ""

        args.each_with_index do |arg, i|

          message = args[i + 1] || message if arg == '-m'
          close = "close" if arg == '-c'
        end

        return message, close
      end
    end
  end
end
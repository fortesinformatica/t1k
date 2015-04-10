require 't1k/commands/init'
require 't1k/commands/hack'

module T1k
  INIT = "init"

  class Command

    def initialize(argv)
      @args = argv
    end

    def run
      puts T1k.setup_credentials

      @args.count == 0 ? help : parse_args(@args)
    end

    def help
      puts "T1K (T-100) Gem. It's a help and let's learn"
      puts ""
      puts "t1k [command] [params]"
      puts ""
      puts T1k::Commands::Init.help
      puts T1k::Commands::Hack.help
    end

    private

    def parse_args(args)
      command = args[0]

      T1k::Commands::Init.run if command == INIT && args.count == 1
    end
  end
end
require 't1k/commands/validate'
require 't1k/commands/init'
require 't1k/commands/hack'
require 't1k/commands/commit'
require 't1k/commands/sink'
require 't1k/commands/ship'

module T1k
  class CLI < Clive
    desc 'Create T1000 credentials file template in your current folder'
    command :init, :setup do
      action do
        Commands::Init.run
      end
    end

    desc 'Validate current credentials'
    command :validate do
      action do
        Commands::Validate.run
      end
    end

    desc 'Checkout to a new branch or existing branch associated with tracked card (issue)'
    command :hack, :hck, arg: '<card_url>' do
      action do
        Commands::Hack.run card_url
      end
    end

    desc 'Commit current staged changes'
    command :commit, :cmt do
      bool :close, :c, 'Close current branch and resolves issue' do |close|
        @close = close
      end

      bool :all, :a, 'Add all changed files' do |add|
        @add = add
      end

      bool :no_message, 'Allow commit with no message' do |no_message|
        @no_message = no_message
      end

      opt :message, :m, 'Add a message to the commit', arg: '<message>' do
        @message = message
      end

      action do
        Commands::Commit.run @message, @close, @add, @no_message
      end
    end

    desc 'Update current branch with master (ie Sync with master)'
    command :sink, :sync do

      action do
        Commands::Sink.run
      end
    end

    desc 'Delivery your changes to local and remote master branch'
    command :ship, :pack, :deliver do

      action do
        Commands::Ship.run
      end
    end

    opt :v, :version, 'Display the current version' do
      puts T1k::VERSION
    end
  end
end

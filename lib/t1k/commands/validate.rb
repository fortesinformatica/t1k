require 'clive'
require 'fileutils'

module T1k
  module Commands
    class Validate

      cattr_accessor :messages
      @@messages = []
      @@errors = []

      def self.run
        T1k.setup_credentials

        c = Validate.credentials?
        t = Validate.trello?
        g = Validate.github?

        @@messages = @@messages + Trackers::Trello.messages + Repositories::Github.messages
        @@errors = @@errors + Trackers::Trello.errors + Repositories::Github.errors

        @@messages.each do |m| puts m.green end

        puts "The are some errors listed below:\n".red unless c && t && g
        @@errors.each do |e| puts e.red end
      end

      def self.credentials?
        exist = File.exist?(T1k::tthousand_path)
        exist ? @@messages << "T1000 file was found" : @@errors << "T1000 file not found"
        exist
      end

      def self.trello?
        Trackers::Trello.valid_keys?
      end

      def self.github?
        Repositories::Github.valid_keys?
      end
    end
  end
end
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
        g = Validate.valid_keys_on_repository?

        @@messages = @@messages + Trackers::Trello.messages + self.default_repository.messages
        @@errors   = @@errors   + Trackers::Trello.errors   + self.default_repository.errors

        @@messages.each do |m| puts m.green end

        puts "The are some errors listed below:\n".red unless c && t && g
        @@errors.each do |e| puts e.red end
      end

      def self.credentials?
        if self.password_from_bitbucket_is_avaliable?
          @@messages << "Password is not avaliable"
        end
        exist = File.exist?(T1k::tthousand_path)
        exist ? @@messages << "T1000 file was found" : @@errors << "T1000 file not found"
        exist
      end

      def self.trello?
        Trackers::Trello.valid_keys?
      end

      def self.valid_keys_on_repository?
        self.default_repository.valid_keys?
      end

      def self.default_repository
        Repository.default_repository
      end

      def self.password_from_bitbucket_is_avaliable?
        self.default_repository == T1k::Repositories::Bitbucket and "#{ENV['BITBUCKET_PWD']}".nil?
      end
    end
  end
end

require 'tinybucket'

module T1k
  module Repositories
    class Bitbucket
      cattr_accessor :oauth_token
      @@oauth_token = ""

      cattr_accessor :oauth_secret
      @@oauth_secret = ""

      cattr_accessor :user
      @@user = ""

      cattr_accessor :repo
      @@repo = ""

      cattr_accessor :repo_owner
      @@repo_owner = ""

      cattr_accessor :password
      @@password = ""

      cattr_accessor :messages
      @@messages = []

      cattr_accessor :errors
      @@errors = []

      Issue = Struct.new(:code, :link)

      def self.create_issue title
        puts 'Creating issue'
        me  = self.login
        rep = me.repo(self.repo_owner, self.repo)
        issue = me.issues.create({ title: title })
        issue_number = self.send(:issue_url_from, issue)

        issue_number
      end

      def self.login
        Tinybucket.configure do |config|
          config.oauth_token = self.oauth_token
          config.oauth_secret = self.oauth_secret
        end
        
        Tinybucket.new
      end

      def self.get_issue number
        if number.nil?
          puts "You should pass a issue number"
          exit 1
        end

        puts 'Recovering existent issue'
        me    = self.login
        issue = rep.issues.find(number)
        issue_number = self.send(:issue_url_from, issue)

        issue_number
      end

      def self.get_issue_number html_url
        exit 1 if html_url.nil?

        code = html_url[html_url.rindex('/')+1..html_url.size]

        Issue.new(code, "Link to code: [#{code}](#{html_url})")
      end

      def self.issue_url_from issue
        issue.links['self']['href']
      end

      def self.setup &block
        yield(self) if block_given?
      end

      def self.valid_keys?
        me = self.login

        begin
          has_project = me.repo(self.repo_owner, self.repo).load
          @@messages << "Wecolme to BitBucket"
        rescue Exception => e
          @@errors << "Bucket not recovery: #{e.message}"
          return false
        end
      end
    end
  end
end

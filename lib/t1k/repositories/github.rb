require 'github_api'

module T1k
  module Repositories
    class Github

      cattr_accessor :oauth_token
      @@oauth_token = ""

      cattr_accessor :user
      @@user = ""

      cattr_accessor :repo
      @@repo = ""

      cattr_accessor :ref_message
      @@ref_message = ""

      cattr_accessor :messages
      @@messages = []
      cattr_accessor :errors
      @@errors = []

      Issue = Struct.new(:code, :link)

      def self.create_issue title
        begin
          puts 'Creating issue'
          github_auth = self.login
          issue       = github_auth.issues.create(user: self.user, repo: self.repo, title: title)

          issue.html_url
        rescue
          raise 'Issue not created'
        end
      end

      def self.get_issue issue_number
        begin
          puts 'Recovering existent issue'
          github_auth = self.login
          issue       = github_auth.issues.get(user: self.user, repo: self.repo, number: issue_number)

          issue.html_url
        rescue
          raise 'Issue not recovered'
        end
      end

      def self.get_issue_number html_url
        code = html_url[html_url.rindex('/')+1..html_url.size]
        Issue.new(code, "Link to code: [#{code}](#{html_url})")
      end

      def self.login
        ::Github.new(oauth_token: self.oauth_token)
      end

      def self.setup &block
        yield(self) if block_given?
      end

      def self.valid_keys?
        begin
          me = self.login.users.get
          @@messages << "Wecolme #{me.name} - Github"
          return true
        rescue Exception => e
          @@errors << e.message
          return false
        end
      end
    end
  end
end

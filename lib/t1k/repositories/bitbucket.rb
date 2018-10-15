require 'bitbucket_rest_api'

module T1k
  module Repositories
    class Bitbucket

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
        me                = self.login
        self.repo_owner   = Bitbucket.get_repo_owner_for me

        issue             = me.issues.create(self.repo_owner, self.repo, { title: title })
        issue_number      = self.send(:issue_url_from, issue)

        issue_number
      end

      def self.login
        BitBucket.new basic_auth:  "#{self.user}:#{self.password}"
      end

      def self.get_issue number
        if number.nil?
          puts "You should pass a issue number"
          exit 1
        end

        puts 'Recovering existent issue'
        me                = self.login
        self.repo_owner   = Bitbucket.get_repo_owner_for me

        issue             = me.issues.find(self.repo_owner, self.repo, number )
        issue_number      = self.send(:issue_url_from, issue)

        issue_number
      end

      def self.get_issue_number html_url
        exit 1 if html_url.nil?

        code = html_url[html_url.rindex('/')+1..html_url.size]

        Issue.new(code, "Link to code: [#{code}](#{html_url})")
      end

      def self.issue_url_from issue
        issue_number = issue["resource_uri"].match(/issues\/\d+$/)[0] if issue["resource_uri"]
        issue_url    = "https://bitbucket.org/#{self.repo_owner}/#{self.repo}/#{issue_number}"

        issue_url
      end

      def self.get_repo_owner_for me
        unless me.kind_of? BitBucket::Client
          puts "You should pass a valid user."
          exit 1
        end

        project = me.repos.all.select {|hash| hash.name == self.repo }

        # /1.0/repositories/OWNER/REPO
        # > 1.	/repositories/
        # > 2.	OWNER

        project[0]['resource_uri'].match(/(\/\w+\/)(\w+)/)[2]
      end

      def self.setup &block
        yield(self) if block_given?
      end

      def self.valid_keys?
        me = Bitbucket.login

        begin
          has_project = me.repos.all.select {|hash| hash.name == self.repo }

          unless has_project.empty?
            @@messages << "Wecolme #{self.user} - BitBucket"
          end

          return not(has_project.empty?)
        rescue Exception => e
          @@errors << e.message
          return false
        end
      end
    end
  end
end

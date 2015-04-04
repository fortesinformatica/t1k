require "github_api"

module T1k
	module Repositories
		class Github

			cattr_accessor :oauth_token
			@@oauth_token = ""

			cattr_accessor :user
			@@user = ""

			cattr_accessor :repo
			@@repo = ""

			def self.setup &block
				yield(self) if block_given?
			end

			def self.create_issue title
				begin
					puts "Creating issue"
					github_auth = ::Github.new(oauth_token: self.oauth_token)
					issue = github_auth.issues.create(user: self.user, repo: self.repo, title: title)
					issue
				rescue
					raise 'Issue not created'
				end			
			end
		end
	end
end
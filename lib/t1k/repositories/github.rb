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

			Issue = Struct.new(:code, :link)

			def self.setup &block
				yield(self) if block_given?
				self.config_keys
			end

			def self.config_keys
				# ::Github.configure do |config|
					# your keys
				# end
			end

			def self.create_issue title
				begin
					puts "Creating issue"
					github_auth = ::Github.new(oauth_token: self.oauth_token)

					existent_issue_match = title.match /^\[#([0-9]*)\]/
					existent_issue = existent_issue_match[1] if existent_issue_match.present?

					if existent_issue.present?
						issue = github_auth.issues.get user: self.user, self.repo, number: existent_issue
					else
						issue = github_auth.issues.create user: self.user, repo: self.repo, title: title
					end
		
					issue
				rescue
					raise 'Issue not created'
				end			
			end

			def self.get_issue html_url
				code = html_url[html_url.rindex('/')+1..html_url.size]
				Issue.new(code, "Link to code: [#{code}](#{html_url})")
			end
		end
	end
end
require 't1k/engine'

module T1k
	autoload :Repository, 't1k/repository'
	autoload :Tracker, 		't1k/tracker'

	module Repositories
		autoload :Github,			't1k/repositories/github'
		autoload :Bitbucket,	't1k/repositories/bitbucket'
	end

	module Trackers
		autoload :Trello, 	't1k/trackers/trello'
		autoload :Pivotal, 	't1k/trackers/pivotal'
	end

	mattr_accessor :repository
	@@repository = T1k::Repository

	mattr_accessor :tracker
	@@tracker = T1k::Tracker


	def self.setup &block
		yield(self) if block_given?
	end

	def self.hack url_card
		card = tracker.get_card(url_card)
		issue = repository.get_issue(repository.create_issue(card.name).html_url)

		tracker.update_card(card, issue)
		puts "Card ##{issue.code} created and tracked"
		issue.code
	end
end
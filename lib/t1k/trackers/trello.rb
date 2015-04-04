require "trello"

module T1k
	module Trackers
		class Trello

			cattr_accessor :developer_public_key
			@@developer_public_key = ""

			cattr_accessor :member_token
			@@member_token = ""

			cattr_accessor :user_name
			@@user_name = ""

			cattr_accessor :board_name
			@@board_name = ""

			::Trello.configure do |config|
		  	config.developer_public_key = self.developer_public_key
			  config.member_token = self.member_token
			end

			def self.setup &block
				yield(self) if block_given?
			end

			def self.get_card url_card
				begin
					puts "Catching card"
					me = ::Trello::Member.find(self.user_name)
					board = me.boards.select{|x| x.name.upcase == self.board_name.upcase}.first
					card = board.cards.select{|x| x.url.index(url_card)}.first
					raise if card.nil?

					card
				rescue
					raise 'Card not found'
				end
			end
		end
	end
end
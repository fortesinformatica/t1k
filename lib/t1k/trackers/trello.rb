require 'trello'

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

      cattr_accessor :messages
      @@messages = []

      cattr_accessor :errors
      @@errors = []

      def self.setup &block
        yield(self) if block_given?
        self.config_keys
      end

      def self.config_keys
        ::Trello.configure do |config|
          config.developer_public_key = self.developer_public_key
          config.member_token         = self.member_token
        end
      end

      def self.valid_keys?
        begin
          me = ::Trello::Member.find(self.user_name)
          @@messages << "Welcome #{me.full_name} - Trello"
          return true
        rescue Exception => e
          @@errors << e.message
          return false
        end
      end

      def self.get_card url_card
        puts "Fetching card"
        begin
          me = ::Trello::Member.find(self.user_name)
          raise "User not found" if me.nil?

          board = me.boards.select{|x| x.name.upcase == self.board_name.upcase}.first
          raise "Board not found.\nBoards available: #{me.boards.map(&:name)}" if board.nil?

          card = board.cards.select{|x| x.url.index(url_card)}.first
          raise "Card not found" if card.nil?

          card
        rescue Exception => e
          raise "#{e.message}"
        end
      end

      def self.update_card card, issue
        puts 'Updating card'
        card.name = "[##{issue.code}] #{card.name}"
        card.desc = "#{issue.link} #{card.desc}"
        card.save
      end
    end
  end
end

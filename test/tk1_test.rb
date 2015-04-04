require 'test_helper'

class T1kTest < ActiveSupport::TestCase

	test "deve configurar o repositório" do
		T1k.setup do |config|
			config.repository.adapter = :github
			config.repository.setup do |c| 
				c.user = "aquinofb"
				c.oauth_token = "ouathouathouathouath"
				c.repo = "t1k"
			end
		end

		assert_equal T1k::Repositories::Github.user, "aquinofb"
		assert_equal T1k::Repositories::Github.oauth_token, "ouathouathouathouath"
		assert_equal T1k::Repositories::Github.repo, "t1k"
	end

	test "deve configurar o tracker" do
		T1k.setup do |config|
			config.tracker.adapter = :trello
			config.tracker.setup do |c|
				c.user_name = "aquinofb"
				c.member_token = "tocotocotoco"
				c.board_name = "t1k"
				c.developer_public_key = "publickeypublickeypublickey"
			end
		end

		assert_equal T1k::Trackers::Trello.user_name, "aquinofb"
		assert_equal T1k::Trackers::Trello.member_token, "tocotocotoco"
		assert_equal T1k::Trackers::Trello.board_name, "t1k"
		assert_equal T1k::Trackers::Trello.developer_public_key, "publickeypublickeypublickey"
	end
end
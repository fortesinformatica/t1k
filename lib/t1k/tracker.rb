module T1k
	class Tracker
		cattr_accessor :adapter
		@@adapter = T1k::Trackers::Trello # default adapter

		def self.get_card url_card
			adapter.get_card url_card
		end

		def self.update_card card, issue_number
			adapter.update_card card, issue_number
		end

		def self.setup &block
			self.adapter.setup(&block) if block_given?
		end

		def self.adapter=(adapter_name)
			raise "Invalid adapter name. Adapter name must be a Symbol." unless adapter_name.class.eql?(Symbol)
			@@adapter = "T1k::Trackers::#{adapter_name.to_s.classify}".constantize
		end
	end
end
module T1k
	class Tracker

		cattr_accessor :adapter
		@@adapter = T1k::Trackers::Trello # default adapter

		def self.setup &block
			self.adapter.setup(&block) if block_given?
			self.delegate(:get_card, :update_card, to: self.adapter)
		end

		def self.adapter=(adapter_name)
			raise "Invalid adapter name. Adapter name must be a Symbol." unless adapter_name.class.eql?(Symbol)
			@@adapter = "T1k::Trackers::#{adapter_name.to_s.classify}".constantize
		end
	end
end
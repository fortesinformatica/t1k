module T1k
	class Repository
		cattr_accessor :adapter
		@@adapter = T1k::Repositories::Github # default adapter

		def self.create_issue card_name
			adapter.create_issue card_name
		end

		def self.get_issue existent_issue_number
			adapter.get_issue existent_issue_number
		end

		def self.get_issue_number issue
			adapter.get_issue_number issue
		end

		def self.setup &block
			self.adapter.setup(&block) if block_given?
		end

		def self.adapter=(adapter_name)
			raise "Invalid adapter name. Adapter name must be a Symbol." unless adapter_name.class.eql?(Symbol)
			@@adapter = "T1k::Repositories::#{adapter_name.to_s.classify}".constantize
		end
	end
end
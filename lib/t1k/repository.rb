module T1k
	class Repository

		cattr_accessor :adapter
		@@adapter = T1k::Repositories::Github # default adapter

		def self.setup &block
			self.adapter.setup(&block) if block_given?
		end

		def self.create_issue title
			self.adapter.create_issue(title)
		end

		def self.get_issue html_url
			code = html_url[html_url.rindex('/')+1..html_url.size]
			Issue.new(code, "Link to code: [#{code}](#{html_url})")
		end

		def self.adapter=(adapter_name)
			raise "Invalid adapter name. Adapter name must be a Symbol." unless adapter_name.class.eql?(Symbol)
			@@adapter = "T1k::Repositories::#{adapter_name.to_s.classify}".constantize
		end

		Issue = Struct.new(:code, :link)
	end
end
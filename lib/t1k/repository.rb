module T1k
  class Repository

    mattr_accessor :adapter
    @@adapter = nil

    cattr_accessor :default_remote_branch
    @@default_remote_branch = ""

    def self.setup &block
      self.adapter.setup(&block) if block_given?
    end

    def self.adapter=(adapter_name)
      raise "Invalid adapter name. Adapter name must be a Symbol." unless adapter_name.class.eql?(Symbol)
      @@adapter = "T1k::Repositories::#{adapter_name.to_s.classify}".constantize
    end

    def self.default_repository
      @@adapter
    end
  end
end

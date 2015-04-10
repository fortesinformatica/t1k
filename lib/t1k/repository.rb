module T1k
  class Repository

    cattr_accessor :adapter
    @@adapter = T1k::Repositories::Github

    class << self
      delegate :create_issue, :get_issue, :get_issue_number, to: @@adapter
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
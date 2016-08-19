require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/inflector'
require 'pathname'

require 'clive'
require 'clive/output'

require 't1k/version'
require 't1k/constants'
require 't1k/command'


require_relative '../spec/support/kernel' if ENV["DEBUG"]

module T1k
  autoload :Repository, 't1k/repository'
  autoload :Tracker,    't1k/tracker'

  module Repositories
    autoload :Github,     't1k/repositories/github'
    autoload :Bitbucket,  't1k/repositories/bitbucket'
  end

  module Trackers
    autoload :None,     't1k/trackers/none'
    autoload :Trello,   't1k/trackers/trello'
    autoload :Pivotal,  't1k/trackers/pivotal'
  end

  mattr_accessor :repository
  @@repository = T1k::Repository

  mattr_accessor :tracker
  @@tracker = T1k::Tracker

  mattr_accessor :tthousand_path
  @@tthousand_path = Pathname.pwd + T1000

  def self.setup &block
    yield(self) if block_given?
  end

  def self.hack url_card
    card                  = tracker.get_card(url_card)
    existent_issue_match  = card.name.match /^\[#([0-9]*)\]/
    existent_issue_number = existent_issue_match[1] if existent_issue_match.present?

    issue = existent_issue_number.present? ? repository.get_issue(existent_issue_number).html_url : repository.create_issue(card.name).html_url

    issue_number = repository.get_issue_number(issue)
    tracker.update_card(card, issue_number) if existent_issue_number.nil?

    puts "Card ##{issue_number.code} created and tracked"

    issue_number.code
  end

  def self.path_to_resources
    File.join(File.dirname(File.expand_path(__FILE__)), '../resources')
  end

  def self.setup_credentials
    eval(File.read(@@tthousand_path)) if File.exists? @@tthousand_path

    Repository.instance_eval do
      @@adapter =  self.default_repository
      class << self
        delegate :create_issue, :get_issue, :get_issue_number, to: @@adapter
      end
    end
  end
end

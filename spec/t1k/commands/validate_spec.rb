require 'spec_helper'
module T1k
  module Repositories
    class Repo
    end
  end
end

describe T1k::Commands::Validate do
  context "repository" do
    it 'does have return the default repository' do
      expect(T1k::Repository).to receive(:default_repository)

      T1k::Commands::Validate.default_repository
    end

    it 'does have valid keys' do
      T1k::Repository.adapter = :repo
      expect(T1k::Commands::Validate.default_repository).to receive(:valid_keys?)

      T1k::Commands::Validate.valid_keys_on_repository?
    end
  end
end

require 'spec_helper'

describe T1k::Commands::Branch do
  it 'does have the actual branch' do
    expect(T1k::Commands::Branch.actual_branch).to eq("branch_name")
  end
end

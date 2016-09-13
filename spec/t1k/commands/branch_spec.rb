require 'spec_helper'

describe T1k::Commands::Branch do
  it 'does have the actual branch' do
    allow_any_instance_of(Kernel).to receive(:`).with(  )
    expect(T1k::Commands::Branch.actual_branch).to eq("branch_name")
  end
end

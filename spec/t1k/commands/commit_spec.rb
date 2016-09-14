require 'spec_helper'

describe T1k::Commands::Commit do
  describe '#self.run' do
    let (:msg)        { "teste" }
    let (:close)      { false   }
    let (:add)        { false   }
    let (:no_message) { true    }

    it "should raise an exception" do
      message    = ""
      no_message =  false

      expect { T1k::Commands::Commit.run( message, close, add, no_message) }.to raise_error("Message can't be blank. Use --no-message to ignore this rule.")
    end


    it "does not raise an exception" do
      message    = ""
      no_message =  true

      expect { T1k::Commands::Commit.run( message, close, add, no_message) }.to_not raise_error("Message can't be blank. Use --no-message to ignore this rule.")
    end

    it "it have to skip circle ci when is not a close commit" do
      close = false
      expect_any_instance_of(Kernel).to receive(:system).with("git commit -m '[ref#branch_name] teste'")

      T1k::Commands::Commit.run( msg, close, add, no_message)
    end

    it "have to close the issue when close=true is passed" do
      close = true
      expect_any_instance_of(Kernel).to receive(:system).with("git commit -m '[close#branch_name] teste'")

      T1k::Commands::Commit.run( msg, close, add, no_message)
    end
  end

end

require 'spec_helper'

describe T1k::Commands::Hack do
  let(:mock_tracker) { double("tracker") }
  describe '#self.run' do
    xit "it have to pass the number to t1k::hack" do
      expect(T1k).to receive(:setup_credentials)
      expect(T1k).to receive(:hack).with("2143")

      T1k::Commands::Hack.run "2143", mock_tracker
    end

  xit 'does something' do
    [
      'git checkout master',
      'git pull --rebase origin master'
    ].each do |cmd|
     allow_any_instance_of(Kernel).to receive(:system).with( cmd )
    end

    mock_tracker = double("tracker")

    expect_any_instance_of(T1k::Tracker).to receive(:get_card).with("2143", mock_tracker)

    T1k::Commands::Hack.run "2143", mock_tracker

    # ele esta fazendo a requisicao para o trello
  end
  end


end

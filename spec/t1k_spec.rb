require 'spec_helper'

describe T1k do

  context '' do

  end

  context '#self.setup_credentials' do
    context 'read a config file' do
      context 'with valid data' do

        before do
          T1k.setup do |config|
            config.repository.adapter = :bitbucket
          end
        end

        context 'on repository' do
          it 'sets default_repository' do
            expect(T1k::Repository.default_repository).to_not be_nil
          end

          it 'default_repository should be Bitbucket' do
            expect(T1k::Repository.default_repository).to eq(T1k::Repositories::Bitbucket)
          end

          it 'adapter should be Bitbucket' do
            expect(T1k::Repository.adapter).to eq(T1k::Repositories::Bitbucket)
          end
        end

        context 'on tracker' do
          it 'adapter is trello' do
            subject.setup_credentials
            expect(T1k::Tracker.adapter).to eq(T1k::Trackers::Trello)
          end
        end
      end
    end

    context 'with invalid data' do
      it 'returns a error for repository' do
        expect {
          T1k.setup do |config|
            config.repository.adapter = :invalid
          end
        }.to raise_error(NameError)
      end


      it 'returns a error for tracker' do
        expect {
          T1k.setup do |config|
            config.tracker.adapter = :invalid
          end
        }.to raise_error(NameError)
      end
    end
  end
end

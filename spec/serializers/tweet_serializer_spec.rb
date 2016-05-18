require 'rails_helper'

RSpec.describe TweetSerializer, :type => :serializer do

  context 'Individual Resource Representation' do
    let(:tweet_factory) { Fabricate(:tweet) }

    let(:serializer) { TweetSerializer.new(tweet_factory) }
    let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

    subject { JSON.parse(serialization.to_json) }

    it { expect(subject['id']).to eql(tweet_factory.id) }
    it { expect(subject['tweet_id']).to eql(tweet_factory.tweet_id) }
    it { expect(subject['media_files']).to eql([]) }
  end
end
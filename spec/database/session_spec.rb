require 'spec_helper'

describe DoubleDog::Database::InMemory do
  let(:db) { described_class.new }

  it "create a session and returns its id" do
    session_id = db.create_session(:user_id => 8)
    expect(session_id).to_not be_a Hash
  end

  it "retrieve a user by session id" do
      user = db.create_user(:username => 'sally', :password => 'seashells')
      session_id = db.create_session(:user_id => user.id)

      retrieved_user = db.get_user_by_session_id(session_id)
      expect(retrieved_user.username).to eq 'sally'
      expect(retrieved_user.has_password? 'seashells').to eq true
  end
end

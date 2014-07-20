require 'spec_helper'


describe DoubleDog::Database::InMemory do
  let(:db) { described_class.new }

  context 'Employees' do
    let(:user){ db.create_user(:username => 'alice', :password => 'pass1')}

    it_behaves_like 'Users'
    it 'are not admin' do
      expect(user.admin?).to eq false
    end
  end

  context 'Administrator' do
    let(:user){db.create_user(:username => 'alice', :password => 'pass1', :admin => true)}

    it_behaves_like 'Users'

    it "is an admin" do
      expect(user.admin?).to eq true
    end
  end

  context 'User actions' do
    it "retrieve a user" do
      user = db.create_user(:username => 'bob', :password => 'pass2')
      retrieved_user = db.get_user(user.id)
      expect(retrieved_user.username).to eq 'bob'
      expect(retrieved_user.has_password? 'pass2').to eq true
    end

    it "retrieve a user by username" do
      user = db.create_user(:username => 'pim', :password => 'cookies')
      retrieved_user = db.get_user_by_username(user.username)

      expect(retrieved_user.username).to eq('pim')
      expect(retrieved_user.has_password? 'cookies').to eq true
    end
  end
end

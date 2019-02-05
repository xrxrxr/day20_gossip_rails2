require 'rails_helper'

RSpec.describe Gossip, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
    	city = FactoryBot.create(:city)
    	user = FactoryBot.create(:user, city: city)
    	gossip = FactoryBot.create(:gossip, user: user)
      expect(gossip).to be_a(Gossip)
      expect(gossip).to be_valid
    end
  end

  context "associations" do
    describe "comments" do
      it "should have_many comments" do
      	city = FactoryBot.create(:city)
    		user = FactoryBot.create(:user, city: city)
      	gossip = FactoryBot.create(:gossip, user: user)
        comment = FactoryBot.create(:comment, gossip: gossip, user: user)
        expect(gossip.comments.include?(comment)).to eq(true)
      end
    end
  end

end

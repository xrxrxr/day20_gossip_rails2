require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
    	city = FactoryBot.create(:city)
    	user = FactoryBot.create(:user, city: city)
    	gossip = FactoryBot.create(:gossip, user: user)
      comment = FactoryBot.create(:comment, gossip: gossip, user: user)
      expect(comment).to be_a(Comment)
      expect(comment).to be_valid
    end
  end

  context "public instance methods" do
    describe "#content" do
      it "should return a string" do
        city = FactoryBot.create(:city)
        user = FactoryBot.create(:user, city: city)
        gossip = FactoryBot.create(:gossip, user: user)
        comment = FactoryBot.create(:comment, gossip: gossip, user: user)
        expect(comment.content).to be_a(String)
      end
    end
  end

end
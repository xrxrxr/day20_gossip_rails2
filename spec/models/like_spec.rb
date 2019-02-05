require 'rails_helper'

RSpec.describe Like, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
      city = FactoryBot.create(:city)
      user = FactoryBot.create(:user, city: city)
      gossip = FactoryBot.create(:gossip, user: user)
    	like = FactoryBot.create(:like, user: user, likeable: gossip)
      expect(like).to be_a(Like)
      expect(like).to be_valid
    end
    describe "#likeable" do
      it "should not be valid without likeable" do
        city = FactoryBot.create(:city)
        user = FactoryBot.create(:user, city: city)
        #gossip = FactoryBot.create(:gossip, user: user)
        bad_like = FactoryBot.build(:like, user: user)
        expect(bad_like).not_to be_valid
        expect(bad_like.errors.include?(:likeable)).to eq(true)
      end
    end
  end
  
end
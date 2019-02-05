require 'rails_helper'

RSpec.describe City, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
    	city = FactoryBot.create(:city)
      expect(city).to be_a(City)
      expect(city).to be_valid
    end
  end

  context "associations" do
    describe "users" do
      it "should have_many users" do
      	city = FactoryBot.create(:city)
    		user = FactoryBot.create(:user, city: city)
        expect(city.users.include?(user)).to eq(true)
      end
    end
  end

end
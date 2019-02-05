require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
    	city = FactoryBot.create(:city)
    	sender = FactoryBot.create(:user, city: city)
    	private_message = FactoryBot.create(:private_message, sender: sender)
      expect(private_message).to be_a(PrivateMessage)
      expect(private_message).to be_valid
    end
  end

  context "public instance methods" do
    describe "#content" do
      it "should return a string" do
        city = FactoryBot.create(:city)
        sender = FactoryBot.create(:user, city: city)
        private_message = FactoryBot.create(:private_message, sender: sender)
        expect(private_message.content).to be_a(String)
      end
    end
  end

end
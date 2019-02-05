require 'rails_helper'

RSpec.describe Tag, type: :model do

  context "validation" do
    it "is valid with valid attributes" do
    	tag = FactoryBot.create(:tag)
      expect(tag).to be_a(Tag)
      expect(tag).to be_valid
    end
  end

  context "public instance methods" do
    describe "#title" do
      it "should return a string" do
        tag = FactoryBot.create(:tag)
        expect(tag.title).to be_a(String)
      end
    end
  end

end
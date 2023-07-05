require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#validation" do

    it "should have valid" do

      user = build(:user)
      expect(user).to be_valid

    end

    it "should not be valid" do

      user = build(:user, login: nil, provider: nil)
      expect(user).not_to be_valid
      expect(user.errors.messages[:login]).to include("can't be blank")
      expect(user.errors.messages[:provider]).to include("can't be blank")

    end

    it "check uniquencec" do

      user = create(:user, login: "Antuan")
      expect(user).to be_valid

      user = build(:user, login: "Antuan")
      expect(user).not_to be_valid

    end

  end

end

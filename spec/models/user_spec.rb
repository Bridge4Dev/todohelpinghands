require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:valid_attributes) {
    {
      first_name: "Matt",
      last_name: "Byrne",
      email: "matt@website.com",
      password: "password",
      password_confirmation: "password"
    }
  }

  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do 
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "MATT@WEBSITE.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like an email" do
      user.email = "matt"
      expect(user).to_not be_valid
    end
    
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "MATT@WEBSITE.COM"))
      #user.downcase_email
      #expect(user.email).to eq("matt@website.com")
      expect{ user.downcase_email }.to change{ user.email }.
        from("MATT@WEBSITE.COM").
        to("matt@website.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "OTHER@WEBSITE.COM"
      expect(user.save).to be true
      expect(user.email).to eq("other@website.com")
    end
  end

end

require 'rails_helper'

describe "Signing up" do
  it "allows a user to sign up for the site and creates the object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "First Name", with: "Matt"
    fill_in "Last Name", with: "Byrne"
    fill_in "Email", with: "matt@website.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
end
  
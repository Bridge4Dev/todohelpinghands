require 'rails_helper'

describe "Logging in" do
  it "logs the user in and goes to the todo lists" do
    User.create(first_name: "Matt", last_name: "Byrne", email: "matt@website.com", password: "password", password_confirmation: "password")
    visit new_user_session_path
    fill_in "Email Address", with: "matt@website.com"
    fill_in "Password", with: "password"
    click_button "Log In"
    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end


  it "displays the email address in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email", with: "matt@website.com"
    fill_in "Password", with: "wrong"
    click_button "Log In"

    expect(page).to have_content("There was a problem logging in.  Please check your email and password.")
    expect(page).to have_field("Email Address", with: "matt@website.com")
  end  
end
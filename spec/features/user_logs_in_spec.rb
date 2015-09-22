require 'rails_helper'

describe "a user can login" do
  before { go_home }
  context "with valid input" do

    it "redirects an unauthenticated user to the sign in page" do
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end

    it "lets a user sign in" do
      login
      expect(page).to have_content "Signed in successfully."
    end
  end

  context "with invalid input" do
    it "doesn't let a user sign in with an invalid password" do
      fill_in "Email", with: "kaadalac@gmail.com"
      fill_in "Password", with: "bad_password"
      click_on "Log in"
      expect(page).to have_content "Invalid email or password"
    end

    it "doesn't let a user sign in with an invalid email" do
      fill_in "Email", with: "kaadalac@gmail.co"
      fill_in "Password", with: "codetheoryio"
      click_on "Log in"
      expect(page).to have_content "Invalid email or password"
    end
  end
end

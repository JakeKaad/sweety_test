require 'rails_helper'

describe "a user can login" do
  context "with valid input" do
    it "redirects an unauthenticated user to the sign in page" do
      visit "http://damp-sands-8561.herokuapp.com/"
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end
end

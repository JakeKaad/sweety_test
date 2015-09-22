require 'rails_helper'

describe "adding a new level" do
  it_behaves_like "require login" do
    let(:action) { visit "http://damp-sands-8561.herokuapp.com/entries" }
    let(:page_content) { "Level Entries" }
  end

  context "as an authenticated user" do
    before do
      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
      end
      login
    end

    it "should be able to navigate via the sidebar link" do
      click_on "Levels"
      expect(page).to have_content "Level Entries"
    end

    it "should be able to add a new level entry", js: true do
      click_on "Levels"
      add_new_entry
      expect(page).to have_content "Entry was successfully created."
      expect(page).to have_content "80 mg/dl"
      delete_last_entry
    end

    it "shouldn't let you add more than 4 for one day" do
      click_on "Levels"
      4.times do
        add_new_entry
      end
      expect(page).to have_content "Entry was successfully created."
      add_new_entry
      expect(page).to have_content "Maximum entries reached for this date."

    end
  end
end

require 'rails_helper'

describe "adding a new level" do
  it_behaves_like "require login" do
    let(:action) { visit "http://damp-sands-8561.herokuapp.com/entries" }
    let(:page_content) { "Level Entries" }
  end

  context "as an authenticated user" do
    before do
      set_selenium
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
      add_four_entries
      expect(page).to have_content "Entry was successfully created."

      add_new_entry
      expect(page).to have_content "Maximum entries reached for this date."

      click_on "Levels"
      delete_four_entries
      expect(page).to have_content("None available")
    end
  end
end


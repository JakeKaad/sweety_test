require 'rails_helper'

describe "a user can toggle the menu display", js: true do
  it "hides and then displays the sidebar when the toggle button is clicked" do
    login
    expect(page).to have_content "Levels"
    click_on "menu-toggle"
    expect(page).to_not have_content "Levels"
    click_on "menu-toggle"
    expect(page).to have_content "Levels"
  end
end

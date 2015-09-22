require 'rails_helper'

describe "reporting pages spec" do
  before { login }
  after { delete_all_entries }

  it "displays the users daily report" do
    click_on "Levels"
    add_four_entries [90, 100, 110, 75], Date.today.to_time
    click_on "Reports"
    expect(page).to have_content "75  110 93"
    click_on "Levels"
  end

  it "displays the users daily report for multiple days" do
    click_on "Levels"
    add_four_entries [90, 100, 110, 75], Date.today.to_time
    add_four_entries [85, 90, 90, 105], Date.yesterday.to_time
    click_on "Reports"
    expect(page).to have_content "75  110 93"
  end
end

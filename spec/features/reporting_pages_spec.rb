require 'rails_helper'

describe "reporting pages spec" do
  it_behaves_like "require login" do
    let(:action) { visit "http://damp-sands-8561.herokuapp.com/report" }
    let(:page_content) { "Level Reports" }
  end

  describe "daily reports" do
    context "as an authenticated user" do
      before do
        login
        click_on "Levels"
        add_new_entry(101, Date.tomorrow.to_time)
        add_four_entries [90, 100, 110, 75], Date.today.to_time
      end

      after { delete_all_entries }

      it "displays the users daily report" do
        click_on "Reports"
        click_on "Daily"
        expect(page).to have_content "75  110 93"
        click_on "Levels"
      end

      it "displays the users daily report for multiple days" do
        add_four_entries [85, 90, 90, 105], Date.yesterday.to_time
        click_on "Reports"
        click_on "Daily"
        expect(page).to have_content "75  110 93"
        expect(page).to have_content "85  105 92"
      end
    end
  end

  describe "monthly reports" do
    context "as an authenticated user" do
      before { login }
      after { delete_all_entries }

      it "displays the users daily report for multiple days" do
        click_on "Levels"
        add_new_entry(101, Date.tomorrow.to_time)
        add_four_entries [90, 100, 110, 75], Date.today.to_time
        add_four_entries [85, 90, 90, 105], Date.yesterday.to_time
        click_on "Reports"
        click_on "Monthly"
        expect(page).to have_content "75  110 94"
      end
    end
  end
end

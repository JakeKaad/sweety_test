def go_home
  visit "http://damp-sands-8561.herokuapp.com/"
end

def login
  go_home
  fill_in "Email", with: "kaadalac@gmail.com"
  fill_in "Password", with: "codetheoryio"
  click_on "Log in"
end

def delete_last_entry
  find(:xpath, "//tbody/tr[1]/td[2]/a").click
  page.driver.browser.switch_to.alert.accept
end

def add_new_entry(amount=nil, time=nil)
  amount ||= 80
  time ||= Time.now
  click_on "Add new"
  fill_in "Level", with: amount
  select  time.strftime("%d"), from: "entry_recorded_at_3i"
  click_on "Submit"
end

def add_four_entries(amounts=nil, time=nil)
  amounts ||= [80, 85, 90, 95]
  amounts.each do |level_amount|
    add_new_entry(level_amount, time)
  end
end

def delete_all_entries
  click_on "Levels"
  begin
    delete_last_entry
    delete_all_entries
  rescue Capybara::ElementNotFound
    expect(page).to have_content "None available"
  end
end

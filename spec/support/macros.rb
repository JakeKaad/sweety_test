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
  click_on "Delete"
  page.driver.browser.switch_to.alert.accept
end

def add_new_entry
  click_on "Add new"
  fill_in "Level", with: 80
  click_on "Submit"
end

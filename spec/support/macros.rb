def go_home
  visit "http://damp-sands-8561.herokuapp.com/"
end

def login
  go_home
  fill_in "Email", with: "kaadalac@gmail.com"
  fill_in "Password", with: "codetheoryio"
  click_on "Log in"
end

Rails.application.routes.draw do
  #need a root path for capybara to run
  root 'tests#testing'
end

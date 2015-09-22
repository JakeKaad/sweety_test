Setup:

1. Install Chrome browser:

```
$ brew install caskroom/cask/brew-cask
$ brew cask install google-chrome
```

2. Install Chrome webdriver:

```
$ cd ~
$ brew install chromedriver
```

4. Setup Ruby environment

```
$ brew install ruby
```

5. Download the repository, install bundler, bundle gemfile:

```
$ gem install bundler
$ git clone https://github.com/JakeKaad/sweety_test.git
$ cd sweet_test
$ bundle install
```

6. Run the test suite

```
bundle exec rspec
```

###Feature requests:
* Add a validation that prevent users from being able to add entries for the future.
  Using the validates_timeliness gem `gem 'validates_timeliness', '~> 3.0'` This looks like:
    `validates_date :date_of_entry, on_or_before: lamda { Time.current.to_date }`


###Suggested changes:
* "Only 4 entries allowed per day" is on the page as a flash message and helper
  in the form. Is that overkill?


###Bugs:
* Daily reporting is reporting entries recorded in the future
* Daily report doesn't show any data unless there is at least one entry for
  tomorrow. I applied a temporary patch to get the specs to pass by adding one
  entry for tomorrow. This should be removed after the bug is fixed.

  This bug might be related to time zone. The time zone where the reports are
  made may be out of sync with the localized time zone that is being displayed
  to a user. If I had the source code I could probably fix this.



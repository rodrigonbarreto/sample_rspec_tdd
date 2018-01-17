# Training test only with ruby and Rspec

#test app

* infor for tests

    * Devise - https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29


ruby -v = ruby 2.4.1p111 - Rails 5.1.4

to run all tests run only: rspec

ex: rspec spec/models/


#SELENIUM TESTS

# Linux
apt-get install chromium-chromedriver
# Mac
brew install chromedriver

#Gemfile for selenium test
Gem 'selenium-webdriver'
gem 'chromedriver-helper' #only headless


#some reference

https://mikecoutermarsh.com/rails-capybara-selenium-chrome-driver-setup/
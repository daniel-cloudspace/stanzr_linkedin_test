require 'rubygems'
require 'capybara'
require 'selenium-client'

username="bogomips@mailinator.com"
password="bogomips"

5.times do 
  firefox = Capybara::Session.new :selenium
  
  firefox.visit 'https://www.linkedin.com/uas/login'
  firefox.fill_in 'session_key-login', :with => username
  firefox.fill_in 'session_password-login', :with => password
  firefox.click_button 'btn-primary'
  firefox.visit 'http://staging.stanzr.com/working'
  firefox.click_link 'head_linkedin'

  matches = firefox.driver.body.match(/bogomips-bogomips/)
  if not matches.nil? and matches.length >= 1
    puts "Successfully logged in"
  else
    puts "Failed to log in"
  end

  firefox.driver.browser.close
end

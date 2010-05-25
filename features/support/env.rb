ENV["RAILS_ENV"] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../../../../config/environment')

require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'cucumber/rails/rspec'
require 'cucumber/rails/world'
require 'cucumber/rails/active_record'
require 'cucumber/web/tableish'

require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
require 'cucumber/rails/capybara_javascript_emulation' # Lets you click links with onclick javascript handlers without using @culerity or @javascript
Capybara.default_selector = :css
Capybara.default_wait_time = 5

ActionController::Base.allow_rescue = false
Cucumber::Rails::World.use_transactional_fixtures = true

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

After("@sop") do |scenario|
  if(scenario.failed?)
    save_and_open_page
  end
end

require 'pickle'
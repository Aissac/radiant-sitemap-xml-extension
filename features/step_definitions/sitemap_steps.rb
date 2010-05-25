Given /^I am logged in as "([^\"]*)"$/ do |role|
  Given %Q{an #{role} "#{role}" exists with login: "#{role}", password: "secret"}
  When %Q{I am on the welcome page}
   And %Q{I fill in "Username or E-mail Address" with "#{role}"}
   And %Q{I fill in "Password" with "secret"}
   And %Q{I press "Login"}
end

Given /^the page structure exists$/ do
  Given %Q{a home page "hp" exists with title: "Home Page"}
end
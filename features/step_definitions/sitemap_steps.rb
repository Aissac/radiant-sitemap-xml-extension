Given /^I am logged in as an admin$/ do
  User.create!(:login => 'admin',
    :password => 'secret',
    :password_confirmation => 'secret',
    :name => 'Administrator',
    :admin => true)
  Given "I go to to \"the welcome page\""
  When "I fill in \"Username\" with \"admin\""
  When "I fill in \"Password\" with \"secret\""
  When "I press \"Login\""
end

Given /^a page "([^\"]*)" exists$/ do |title|
  Factory.create(:page, :title => title)
end

Given /^a hidden page "([^\"]*)" exists$/ do |title|
  Factory.create(:hidden_page, :title => title)
end

Then /^"([^\"]*)" should "([^\"]*)" in the sitemap with "([^\"]*)" frequency and "([^\"]*)" priority$/ do |t, s, f, p|
  @page = Page.find_by_title(t)
  @page.sitemap.should be_true
  @page.change_frequency.should == f
  @page.priority == p
end
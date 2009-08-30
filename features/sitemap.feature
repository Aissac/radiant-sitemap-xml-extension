Feature: Sitemap XML generation
  In order to improve my site's exposure to search bots
  As an admin
  I want to create xml sitemaps
  
  Background:
    Given a page "Page 1" exists
    Given I am logged in as an admin

  Scenario: Saving a page's sitemap options
    Given I follow "Page 1"
     When I check "Appear in sitemap"
      And I select "hourly" from "Change frequency"
      And I select "0.7" from "Priority"
      And I press "Save changes"
     Then "Page 1" should "appear" in the sitemap with "hourly" frequency and "0.7" priority
  
  Scenario: Viewing the sitemap
    Given a hidden page "Page 2" exists
     When I am on "sitemap.xml"
     Then I should see "page-1"
      And I should not see "page-2"
     
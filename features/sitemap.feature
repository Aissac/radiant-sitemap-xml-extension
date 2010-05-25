Feature: Sitemap XML generation
  In order to improve my site's exposure to search bots
  As an admin
  I want to create xml sitemaps
  
  Background:
    Given the page structure exists
      And I am logged in as "admin"
  
  Scenario: Saving a page's sitemap options
    Given a page "p1" exists with title: "Page 1", parent: page "hp"
      And I am on the admin pages page
     When I follow "Page 1"
      And I check "Appear in sitemap"
      And I select "hourly" from "Change frequency"
      And I select "0.7" from "Priority"
      And I press "Save Changes"
     Then a page should exist with title: "Page 1", sitemap: true, change_frequency: "hourly", priority: "0.7"
  
  Scenario: Viewing the sitemap (hidden, reviewed, draft, scheduled, virtual, the page specified not to be visible should not appear in sitemap)
    Given a page visible in sitemap exists with title: "Page 1", parent: page "hp"
      And a page not visible in sitemap exists with title: "Page 2", parent: page "hp"
      And a draft page exists with title: "Draft", parent: page "hp"
      And a reviewed page exists with title: "Reviewed", parent: page "hp"
      And a hidden page exists with title: "Hidden", parent: page "hp"
      And a scheduled page exists with title: "Scheduled", parent: page "hp"
      And a virtual page exists with title: "Virtual", parent: page "hp"
     When I am on "sitemap.xml"
     Then I should see "page-1"
      And I should not see "page-2"
      And I should not see "draft"
      And I should not see "reviewed"
      And I should not see "hidden"
      And I should not see "scheduled"
      And I should not see "virtual"
     
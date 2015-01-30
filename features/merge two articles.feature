Feature: Merge Two Articles
  As a blog administrator
  In order to join articles with the similar content
  I want to merge articles

  Background:
    Given the blog is set up
    And the following users:
      | login       | password  | name        |email                     | profile_id  |
      | nonadminone | 123456    | nonadminone |nonadminone@none.com      | 2           |
      | theadmin    | 123456    | theadmin    |theadmin@none.com         | 1           |
    And the following articles:
      | title   | body                  | author      |
      | privet  | Shla Sasha po shosse  | nonadminone |

  Scenario: A non-admin cannot merge two articles
    Given I am logged in as "nonadminone" with the password "123456"
    And I am on the edit page of article "privet"
    Then I should see the body of article "privet"
    And I should not see "Article ID"

  Scenario: Admin can merge two articles
    Given I am logged in as "theadmin" with the password "123456"
    And I am on the edit page of article "privet"
    Then I should see the body of article "privet"
    And I should see "Article ID"
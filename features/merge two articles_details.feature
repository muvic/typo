Feature: Merge Two Articles
  As a blog administrator
  In order to join articles with the similar content
  I want to merge articles

  Background:
    Given the blog is set up
    And the following users:
      | login       | password  | name        |email                     | profile_id  |
      | nonadminone | 123456    | nonadminone |nonadminone@none.com      | 2           |
      | nonadmintwo | 123456    | nonadmintwo |nonadmintwo@none.com      | 2           |
      | theadmin    | 123456    | theadmin    |theadmin@none.com         | 1           |
    And the following articles:
      | title   | body                  | author      |
      | privet  | Shla Sasha po shosse  | nonadminone |
      | abzats  | abzats body           | nonadmintwo |
    And the following comments:
      | title   | author      | body    | article_id  |
      | comm_0  | comm_user_0 | telo_0  | privet      |
      | comm_1  | comm_user_1 | telo_1  | privet      |
      | comm_10 | comm_user_2 | telo_2  | abzats      |
      | comm_11 | comm_user_3 | telo_3  | abzats      |
      | comm_12 | comm_user_4 | telo_4  | abzats      |

    And I am logged in as "theadmin" with the password "123456"
    And I am on the edit page of article "privet"
    And I fill in Article ID with the id of "abzats" article
    And I press "Merge"

  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article) and either title
    Given I am on the manage articles page
    Then I should see two articles with the title "privet" and authored by the "nonadminone"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Then the merged article should contain the text of "privet" and "abzats"

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
    Then "abzats" should have "0" comments
    And "privet" should have "0" comments
    And merged from "privet" and "abzats" article should have "5" comments
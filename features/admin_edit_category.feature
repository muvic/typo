Feature: Edit Category (Admin User)
  As a blog administrator
  In order to reflect changes the for the blog categories
  I want to edit category

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following category exists "Kategoriya001"

  Scenario: Edit Category
    Given I am on the categories page
    And I follow "Kategoriya001"
    And I fill in "category_name" with "Kategoriya002"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category was successfully saved."
    And I should see "Kategoriya002"
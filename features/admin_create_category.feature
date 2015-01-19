Feature: Create New Category (Admin User)
  As a blog administrator
  In order to increase the diversity for the blogs
  I want to create new category

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Create New Category
    Given I am on the categories page
    When I fill in "category_name" with "AzBuki"
    And I fill in "category_permalink" with "Vedi"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category was successfully saved."
    And I should see "AzBuki"
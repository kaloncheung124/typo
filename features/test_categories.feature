Feature: The categories feature should work
  
  As a blog administrator
  So that I can manage and create categories
  I want to be able to access the categories admin page
  
Background:
  Given the blog is set up
  And I am logged into "admin" with "aaaaaaaa"
  And I am on the manage articles page
  And I follow "Categories"
  
Scenario: The categories link should work
  Given I should not see "ActiveRecord::RecordNotFound"
  And I should see "Keywords"
  And I should see "Description"
 
Scenario: I can create a category
  When I fill in "Name" with "Personal"
  And I fill in "Description" with "This time, it's personal"
  And I press "Save"
  Then I should see "Personal"
  And I should see "This time, it's personal"
  
Scenario: I can edit a category
  When I fill in "Name" with "Personal"
  And I press "Save"
  Then I should not see "space"
  When I follow "Personal"
  And I fill in "Description" with "space"
  And I press "Save"
  Then I should see "Personal"
  And I should see "space"
Feature: Admins can merge articles, combining the text

  As a blog administrator
  In order to combine similar articles into one
  I want to merge these two articles

Background:
  Given the blog is set up
  And I am logged into "admin" with "aaaaaaaa"
  And the following users exist:
  | login     | password    | email      | profile_id | name      | state  |
  | publisher | publication | po@joe.com | 2          | publisher | active |

  Given I write a new article with title: "Electric Shocks" and body: "Power things"
  And I write a new article with title: "Water Rules" and body: "Shoot water"

  And the following comments exist:
  | title    | author   | body         | article_id | user_id| published | published_at |
  | comment1 | somebody | Good Writing | 3          | 1      | true      | 2016-04-02   |
  | comment2 | anon     | Bad Font     | 4          | 2      | true      | 2016-03-22   |

Scenario: The article merging deletes the second article
  And I am on the edit page for article 4
  When I fill in "merge_id" with "3"
  And I press "Merge With This Article"
  Then I should be on the manage articles page
  And I should not see "Electric Shocks"

Scenario: When articles are merged, the merged article should contain the text of both previous articles
  And I am on the edit page for article 4
  When I fill in "merge_id" with "3"
  And I press "Merge With This Article"
  When I am on the home page
  Then I should see "Water Rules"
  And I should not see "Electric Shocks"
  When I follow "Water Rules"
  Then I should see "Good Writing"
  And I should see "Bad Font"
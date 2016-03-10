Feature: Admins can merge articles, combining the text

  As a blog administrator
  In order to combine similar articles into one
  I want to merge these two articles

Background:
  Given the blog is set up
  And the following users exist:
  | login     | password    | email      | profile_id | name      | state  |
  | publisher | publication | po@joe.com | 2          | publisher | active |

  And the following articles exist:
  | title           | author    | body         | user_id | published | allow_comments | created_at | published_at | type    | state     |
  | Electric Shocks | publisher | Power things | 2       | true      | true           | 2016-04-01 | 2016-04-01   | Article | published |
  | Water Rules     | publisher | Shoot water  | 2       | true      | true           | 2016-03-21 | 2016-03-21   | Article | published |

  And the following comments exist:
  | title    | author   | body         | article_id | user_id| published | published_at |
  | comment1 | somebody | Good Writing | 3          | 1      | true      | 2016-04-02   |
  | comment2 | anon     | Bad Font     | 4          | 2      | true      | 2016-03-22   |


Scenario: A non-admin cannot merge two articles
  Given I am logged into "publisher" with "publication"
  When I am on the edit page for article 3
  Then I should see "Power things"
  And I should not see "Merge Articles"

Scenario: An admin is allowed to merge articles
  Given I am logged into "admin" with "aaaaaaaa"
  When I am on the edit page for article 4
  Then I should see "Shoot water"
  Then I should see "Merge Articles"
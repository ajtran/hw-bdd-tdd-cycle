Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"

Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Alien' has no director info"
  
Scenario: delete star wars
  Given I am on the details page for "Blade Runner"
  When I press "Delete"
  Then I should be on the RottenPotatoes home page
  # Then I should not see "Blade Runner"
  
Scenario: Add Toy Story and sort by title
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  When I fill in "Title" with "Toy Story"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  And  I should see "Toy Story"
  When I follow "Movie Title"
  Then I should see "Alien" before "Toy Story"
  
Scenario: Add a Toy Story II, filter, and sort by release date
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  When I fill in "Title" with "Toy Story II"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  When I uncheck the following ratings: G PG-13
  And I press "Refresh"
  Then  I should see "Toy Story II"
  When I follow "Release Date"
  Then I should see "Alien" before "Blade Runner"
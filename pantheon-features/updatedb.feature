Feature: Update database
  In order to know that update.php is working
  As a website user
  I need to be able to run database updates

  @api
  Scenario: Control to make sure updatedb can be run when there are no updates pending
    Given I am logged in as a user with the "administrator" role
    And I am on "/update.php"
    Then I should see "Drupal database update"
    When I follow "Continue"
    Then I should see "No pending updates."

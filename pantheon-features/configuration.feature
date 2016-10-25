Feature: Homepage
  In order to know that configuration is working
  As a website user
  I need to be able to export and import configuration

  Scenario: Control to make sure site has default configuration
    Given I am on "/"
    Then I should see "Powered by Drupal"

  @api
  Scenario: Control to make sure we are set up to test configuration
    Given I am logged in as a user with the "administrator" role
    And I have exported configuration
    And I am on "/admin/config/development/configuration"
    Then I should see "There are no configuration changes to import."

  Scenario: Set up and change something to test
    Given I have run the drush command "config-set block.block.bartik_powered region 0"
    And I am on "/"
    Then I should not see "Powered by Drupal"

  @api
  Scenario: Import configuration files to undo previous change
    Given I am logged in as a user with the "administrator" role
    And I am on "/admin/config/development/configuration"
    And I press "Import all"
    And I wait for the progress bar to finish
    Then I should see "The configuration was imported successfully"

  Scenario: Make sure site went back to the way it originally was
    Given I am on "/"
    Then I should see "Powered by Drupal"

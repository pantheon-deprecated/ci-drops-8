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

  @api
  Scenario: Determine whether a module can be installed and updated with its update_N hooks
    Given I am logged in as a user with the "administrator" role
    And I am on "/admin/modules/install"
    And I enter "https://ftp.drupal.org/files/projects/simple_sitemap-8.x-2.3.tar.gz" for "edit-project-url"
    And I press "Install"
    And I wait for the progress bar to finish
    Then I should see "Installation was completed successfully."
    When I follow "Enable newly added modules"
    Then I should see "Creates a standard conform XML sitemap of your content"
    When I check the box "Simple XML Sitemap"
    And I press "Install"
    Then I should see "Module Simple XML Sitemap has been enabled"
    When I am on "/admin/modules/update"
    Then I should see "8.x-2.3"
    When I check the box "Select all rows in this table"
    And I press "Download these updates"
    And I wait for the progress bar to finish
    Then I should see "Updates downloaded successfully"
    When I press "Continue"
    And I wait for the progress bar to finish
    Then I should see "Update was completed successfully"
    When I follow "Run database updates"
    Then I should see "Drupal database update"
    When I press "Continue"
    Then I should see "Changing the data structure of the module's configuration"
    When I press "Apply pending updates"
    And I wait for the progress bar to finish
    Then I should see "Updates were attempted"
    # TODO: find some text that would always appear if there were an error


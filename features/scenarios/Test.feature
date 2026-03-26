Feature: Swag Labs E-commerce Workflow
  As a shopper on Swag Labs (saucedemo.com)
  I want to browse and interact with products
  So that I can practise page object patterns with a real test site

  Background:
    Given I am on the Swag Labs login page

  @smoke @login
  Scenario: Successful login with valid credentials
    When I login with username "standard_user" and password "secret_sauce"
    Then I should see the products page

  @smoke @login
  Scenario: Failed login with invalid credentials
    When I login with username "invalid_user" and password "wrong_password"
    Then I should see a login error message

  @cart
  Scenario: Add a product to the cart
    Given I am logged in as "standard_user" with password "secret_sauce"
    When I add the first product to the cart
    Then the cart should show 1 item

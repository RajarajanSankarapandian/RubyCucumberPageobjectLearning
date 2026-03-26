require 'rspec/matchers'

Given('I am on the Swag Labs login page') do
  visit LoginPage
end

When('I login with username {string} and password {string}') do |username, password|
  on(LoginPage) { |page| page.login(username, password) }
end

Then('I should see the products page') do
  on(InventoryPage) do |page|
    expect(page.products_page?).to be true
  end
end

Then('I should see a login error message') do
  on(LoginPage) do |page|
    expect(page.error_displayed?).to be true
  end
end

Given('I am logged in as {string} with password {string}') do |username, password|
  on(LoginPage) { |page| page.login(username, password) }
end

When('I add the first product to the cart') do
  on(InventoryPage) { |page| page.add_item_to_cart(0) }
end

Then('the cart should show {int} item(s)') do |count|
  on(InventoryPage) do |page|
    expect(page.cart_item_count).to eq(count)
  end
end

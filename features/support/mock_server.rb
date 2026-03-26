require 'webrick'
require 'net/http'

VALID_USERS     = { 'standard_user' => 'secret_sauce' }.freeze
INVENTORY_ITEMS = [
  'Sauce Labs Backpack', 'Sauce Labs Bike Light',
  'Sauce Labs Bolt T-Shirt', 'Sauce Labs Fleece Jacket',
  'Sauce Labs Onesie', 'Test.allTheThings() T-Shirt'
].freeze

module MockSaucedemo
  # ── Login page – credentials validated client-side, no redirect needed ─────
  def self.login_html
    <<~HTML
      <!DOCTYPE html><html>
      <head><title>Swag Labs</title></head>
      <body>
        <div data-test="error" class="error-message-container"
             id="error-msg" style="display:none">
          Epic sadface: Username and password do not match any user in this service
        </div>
        <form id="login-form" onsubmit="return false">
          <input type="text"     id="user-name" name="username" autocomplete="off" />
          <input type="password" id="password"  name="password" autocomplete="off" />
          <button type="submit"  id="login-button"
                  onclick="doLogin()">Login</button>
        </form>
        <script>
          var VALID = {"standard_user":"secret_sauce",
                       "locked_out_user":"secret_sauce",
                       "problem_user":"secret_sauce"};
          function doLogin() {
            var u = document.getElementById('user-name').value;
            var p = document.getElementById('password').value;
            if (VALID[u] && VALID[u] === p) {
              window.location.href = '/inventory';
            } else {
              document.getElementById('error-msg').style.display = 'block';
            }
          }
        </script>
      </body></html>
    HTML
  end

  # ── Inventory page – add-to-cart handled client-side ──────────────────────
  def self.inventory_html
    item_rows = INVENTORY_ITEMS.map { |name|
      <<~ITEM
        <div class="inventory_item">
          <div class="inventory_item_name">#{name}</div>
          <button class="btn_primary btn_inventory"
                  onclick="addToCart()">Add to cart</button>
        </div>
      ITEM
    }.join

    <<~HTML
      <!DOCTYPE html><html>
      <head><title>Swag Labs</title></head>
      <body>
        <a class="shopping_cart_link" href="/cart" id="cart-link">
          <!-- badge injected by JS -->
        </a>
        <span class="title">Products</span>
        #{item_rows}
        <script>
          var cartCount = 0;
          function addToCart() {
            cartCount++;
            var link  = document.getElementById('cart-link');
            var badge = document.querySelector('.shopping_cart_badge');
            if (!badge) {
              badge = document.createElement('span');
              badge.className = 'shopping_cart_badge';
              link.appendChild(badge);
            }
            badge.textContent = String(cartCount);
          }
        </script>
      </body></html>
    HTML
  end

  # ── Servlet ────────────────────────────────────────────────────────────────
  class AppServlet < WEBrick::HTTPServlet::AbstractServlet
    def do_GET(req, res)
      res.status       = 200
      res.content_type = 'text/html'
      res.body = case req.path
                 when '/'         then MockSaucedemo.login_html
                 when '/inventory' then MockSaucedemo.inventory_html
                 else '404 Not Found'
                 end
    end
    alias do_POST do_GET
  end
end

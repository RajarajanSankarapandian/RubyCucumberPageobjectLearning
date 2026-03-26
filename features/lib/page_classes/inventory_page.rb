class InventoryPage
  include PageObject

  span  :page_title,  class: 'title'
  link  :cart_link,   class: 'shopping_cart_link'
  span  :cart_badge,  class: 'shopping_cart_badge'

  elements :inventory_items, :div, class: 'inventory_item'

  def product_count
    inventory_items_elements.count
  end

  def add_item_to_cart(index = 0)
    add_buttons = @browser.buttons(css: '.btn_inventory')
    raise "No add-to-cart buttons found" if add_buttons.empty?

    add_buttons[index].click
  end

  def cart_item_count
    cart_badge? ? cart_badge.to_i : 0
  end

  def products_page?
    page_title == 'Products'
  end
end

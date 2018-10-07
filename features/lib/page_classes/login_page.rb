# Page class for storing elements of LoginPage
class LoginPage
  include PageObject
  include PageFactory
  require 'rautomation'
  require 'rspec/matchers'
  require 'rspec/expectations'
  require 'roo/excelx/sheet'
  include RAutomation


  text_field :username, id: 'j_username'
  text_field :password, id: 'j_password'
  link :sign_in, name: 'SignIn'
  link :iphone, text: 'iPhone 5'
  file_field :photo, id: 'photo'
  link :add_to_card, title: 'Add to cart'
  link :quick, {text: 'Quick view'}
  img :tshirt, src: 'http://automationpractice.com/img/p/1/1-home_default.jpg'
  link :women, text: 'Women'
  link :tshirts, text: 'T-shirts'

  def login_page
    # self.username = 'admin'
    # self.password = 'apollo'
    # self.sign_in
    # self.class.link(:product_category, text: 'Product Category')
    # self.product_category_element.hover
    # self.class.link(:test1, href: 'http://store.demoqa.com/products-page/product-category/accessories/')
    # wait_until {self.test1_element.present?}
    # wait_until {self.photo?}
    # self.photo_element.click
    # window = RAutomation::Window.new(title: /Open/)
    # window.activate
    # puts "Window available" if window.present?
    # self.test1
    # wait_until {self.iphone_element.present?}
    # self.iphone
    self.tshirt_element.wait_until(&:present?)
    self.tshirt_element.hover
    wait_until {self.add_to_card?}
    self.add_to_card
    puts "Cart Added"
    self.women_element.hover
    self.women
    self.women_element.hover
    self.tshirts
    self.quick if self.quick?
    puts "clicked quick button"
    sleep 3
  end

  def excel
    #xlsx = Roo::Spreadsheet.open('data/data1.xlsx')
    #xlsx = Spreadsheet::Worksheet.new
    xlsx = Roo::Excelx.new('data/data1.xlsx')
    sheet = xlsx.sheet('Sheet1').column(1)
    puts sheet
    test = xlsx.sheet(0).cell(1, 1)
    puts test
    puts 'Pass' if test.include?('Name')
    xlsx.each_row_streaming {|row| puts row}
  end
end
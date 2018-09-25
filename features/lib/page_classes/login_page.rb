
# Page class for storing elements of LoginPage
class LoginPage
  include PageObject
  include PageFactory
  require 'rspec/matchers'
  require 'rspec/expectations'
  require 'roo/excelx/sheet'


  text_field :username,  id: 'j_username'
  text_field :password,  id: 'j_password'
  link :sign_in, name: 'SignIn'
  link :iphone, text: 'iPhone 5'
  def login_page
    # self.username = 'admin'
    # self.password = 'apollo'
    # self.sign_in
    self.class.link(:product_category, text: 'Product Category')
    self.product_category_element.hover
    self.class.link(:test1, href: 'http://store.demoqa.com/products-page/product-category/accessories/')
    wait_until {self.test1_element.present?}
    self.test1
    wait_until {self.iphone_element.present?}
    self.iphone
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
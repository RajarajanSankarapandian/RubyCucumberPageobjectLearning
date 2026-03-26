class LoginPage
  include PageObject
  require 'rspec/matchers'
  require 'rspec/expectations'
  require 'roo'

  page_url 'https://www.saucedemo.com'

  text_field :username, id: 'user-name'
  text_field :password, id: 'password'
  button     :login_button, id: 'login-button'
  div        :error_container, css: "[data-test='error']"

  def login(user, pass)
    self.username = user
    self.password = pass
    self.login_button
  end

  def login_with_valid_credentials
    login('standard_user', 'secret_sauce')
  end

  def login_with_invalid_credentials
    login('invalid_user', 'wrong_password')
  end

  def error_displayed?
    error_container_element.present?
  end

  def excel_data
    xlsx = Roo::Spreadsheet.open('data/data1.xlsx')
    sheet = xlsx.sheet(0)
    puts "Reading Excel data:"
    sheet.each_row_streaming do |row|
      puts row.map(&:value).join(', ')
    end
    sheet.cell(1, 1)
  end
end

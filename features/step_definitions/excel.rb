
require 'roo'
require 'roo/excelx/sheet'

def excel_test
  #xlsx = Roo::Spreadsheet.open('data/data1.xlsx')
  #xlsx = Spreadsheet::Worksheet.new
  xlsx = Roo::Excelx.new('data/data1.xlsx')
  sheet = xlsx.sheet('Sheet1').column(1)
  puts sheet
  test = xlsx.sheet(0).cell(1, 1)
  puts test
  puts 'Pass' if test.include?('Name')
  xlsx.each_row_streaming do |row|
    puts row
  end
end

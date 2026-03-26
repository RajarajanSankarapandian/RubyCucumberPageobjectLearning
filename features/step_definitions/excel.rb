require 'roo'

def excel_test(file_path = 'data/data1.xlsx')
  xlsx = Roo::Spreadsheet.open(file_path)
  sheet = xlsx.sheet(0)

  first_cell = sheet.cell(1, 1).to_s
  puts "First cell value: #{first_cell}"
  puts 'Pass' if first_cell.include?('Name')

  puts "All rows:"
  sheet.each_row_streaming do |row|
    puts row.map(&:value).join(', ')
  end

  first_cell
end

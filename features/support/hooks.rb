Before do
  @browser = Watir::Browser.new :chrome
end

After do |scenario|
  if scenario.failed?
    screenshot_path = "error_screenshot_#{scenario.name.gsub(/\s+/, '_')}.png"
    @browser.screenshot.save screenshot_path
    attach(@browser.screenshot.base64, 'image/png')
  end
  @browser.close
end

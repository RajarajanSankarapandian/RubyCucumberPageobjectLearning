Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1280,900')

  # Point to a local Chromium binary when CHROME_BIN env var is set (e.g. CI)
  options.binary = ENV['CHROME_BIN'] if ENV['CHROME_BIN']

  @browser = Watir::Browser.new(:chrome, options: options)
end

After do |scenario|
  if @browser
    if scenario.failed?
      screenshot_path = "error_screenshot_#{scenario.name.gsub(/\s+/, '_')}.png"
      @browser.screenshot.save screenshot_path
      attach(@browser.screenshot.base64, 'image/png')
    end
    @browser.close
  end
end

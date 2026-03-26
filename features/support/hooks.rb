Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1280,900')

  # Use CHROME_BIN when set (e.g. CI); falls back to system Chrome on PATH
  options.binary = ENV['CHROME_BIN'] if ENV['CHROME_BIN']

  # Use CHROMEDRIVER_PATH when set; lets Selenium Manager handle it otherwise
  service_args = {}
  service_args[:path] = ENV['CHROMEDRIVER_PATH'] if ENV['CHROMEDRIVER_PATH']
  service = Selenium::WebDriver::Chrome::Service.new(**service_args)

  @browser = Watir::Browser.new(:chrome, options: options, service: service)
end

After do |scenario|
  if @browser
    # Always capture the final state; embed into the HTML report
    screenshot_path = "screenshot_#{scenario.name.gsub(/\s+/, '_')}.png"
    @browser.screenshot.save screenshot_path
    attach(@browser.screenshot.base64, 'image/png')
    @browser.close
  end
end

Before do
  @browser = Watir::Browser.new :chrome
  @browser.goto 'http://automationpractice.com/index.php'
#  @browser.goto 'http://toolsqa.com/automation-practice-form/'
  @browser.window.maximize
end


After do |scenario|

  if scenario.failed?
    @browser.screenshot.save "error_screenshot.png"
    encod_img = @browser.screenshot.base64
    embed("data:image/png;base64,#{encod_img}",'image/png')
    @browser.close
  end
  end




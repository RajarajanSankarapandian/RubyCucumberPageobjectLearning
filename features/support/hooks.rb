Before do
  @browser = Watir::Browser.new :chrome
  @browser.goto 'http://toolsqa.com/automation-practice-form/'
  @browser.window.maximize
end


After do
@browser.close
end




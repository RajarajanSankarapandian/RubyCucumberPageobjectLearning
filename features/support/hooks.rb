Before do
  @browser = Watir::Browser.new :chrome
  @browser.goto 'http://store.demoqa.com/'
  @browser.window.maximize
end


After do
@browser.close
end




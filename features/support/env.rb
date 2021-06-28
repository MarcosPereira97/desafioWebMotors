require "rspec"
require "yaml"
require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "cucumber/rake/task"
require "report_builder"

@browser = ENV["BROWSER"]

Capybara.configure do |config|
  case @browser
  when "chrome"
    @driver = :selenium_chrome
  when "firefox"
    @driver = :selenium
  when "chrome_headless"
    @driver = :selenium_chrome_headless
  when "firefox_headless"
    @driver = :selenium_headless
  end

  config.default_driver = @driver
  config.default_max_wait_time = 30
  config.default_selector = :xpath
end

Capybara.register_driver :selenium_chrome do |app|
  prefs = { "profile.managed_default_content_settings.notifications" => 2 }
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: { prefs: prefs })

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
end

EL = YAML.load_file("./data/elm.yml")

require "selenium-webdriver"
require "cucumber/rake/task"

Before do
  @metodos = Metodos.new
  @test = WebmotorsTest.new

  Capybara.current_session.driver.browser.manage.delete_all_cookies
  page.driver.browser.manage.window.maximize
end

After do |scenario| 
  Dir.mkdir("data") unless Dir.exist?("data")
  Dir.mkdir("report") unless Dir.exist?("report")
  sufix = ("error" if scenario.failed?) || "success"
  name = scenario.name.tr(" ", "_").downcase
  image_name = "data/report/img/#{sufix}-#{name}.png"
  temp_shot = page.save_screenshot(image_name)
  file_shot = File.open(temp_shot, "rb").read
  final_shot = Base64.encode64(file_shot)
  embed(temp_shot, "image/png", "Evidência!")
end

at_exit do
  run_driver = Capybara.default_driver.to_s.capitalize
  env_url = EL["Webmotors"]
  date = Time.now.strftime("%a: %d/%m/%Y")
  time = Time.now.strftime("%H:%M")
  ReportBuilder.configure do |config|
    config.json_path = "data/report/report.json"
    config.report_path = "data/report/Tests E2E Reports"
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = "Report"
    config.include_images = true
    config.compress_images = false
    config.color = "indigo"
    config.additional_info = { "Projeto:" => "WebMotors",
                               "Navegador:" => run_driver,
                               "URL:" => env_url,
                               "Data:" => "#{date} - #{time}"}

    puts "Report build with success on #{config.report_path}"
  end
  ReportBuilder.build_report
end

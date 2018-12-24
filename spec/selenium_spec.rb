require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "UntitledTestCase" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.katalon.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_untitled_test_case" do
    @driver.get "http://localhost:3000/users/sign_in"
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "test@gmail.com"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "qwerty"
    @driver.find_element(:name, "commit").click
    (@driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Login'])[1]/following::p[1]").text).should == "Invalid Email or password."
    @driver.find_element(:link, "Sign up").click
    @driver.find_element(:id, "user_username").click
    @driver.find_element(:id, "user_username").clear
    @driver.find_element(:id, "user_username").send_keys "vadim"
    @driver.find_element(:id, "user_email").click
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "test@gmail.com"
    @driver.find_element(:id, "user_password").click
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "qwerty"
    @driver.find_element(:id, "user_password_confirmation").click
    @driver.find_element(:id, "user_password_confirmation").clear
    @driver.find_element(:id, "user_password_confirmation").send_keys "qwerty"
    @driver.find_element(:name, "commit").click
    (@driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Logout'])[1]/following::p[1]").text).should == "Welcome! You have signed up successfully."
    @driver.find_element(:link, "New exercise").click
    @driver.find_element(:id, "exercise_title").click
    @driver.find_element(:id, "exercise_title").clear
    @driver.find_element(:id, "exercise_title").send_keys "hello"
    @driver.find_element(:id, "exercise_description").click
    @driver.find_element(:id, "exercise_description").clear
    @driver.find_element(:id, "exercise_description").send_keys "world"
    @driver.find_element(:name, "commit").click
    (@driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Logout'])[1]/following::p[1]").text).should == "Exercise was successfully created."
    @driver.find_element(:id, "comment_comment").click
    @driver.find_element(:id, "comment_comment").clear
    @driver.find_element(:id, "comment_comment").send_keys "cool"
    @driver.find_element(:name, "commit").click
    (@driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='hello'])[1]/following::h1[1]").text).should == "Total comments: 1"
    @driver.get "http://localhost:3000/feed"
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='Show me'])[1]/following::button[1]").click
    @driver.find_element(:xpath, "(.//*[normalize-space(text()) and normalize-space(.)='vadim'])[1]/following::button[1]").click
    @driver.get "http://localhost:3000/saves"
    @driver.find_element(:link, "Show me").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end

  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end

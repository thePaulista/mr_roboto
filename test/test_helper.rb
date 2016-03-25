ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'
require 'database_cleaner'

Capybara.app = RobotWorldApp
Capybara.save_and_open_page_path = "tmp/capybara"

DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/robot_manager_test.sqlite3")}].strategy = :truncation

module TestHelper
  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  def robot_manager
    database = Sequel.sqlite("db/robot_manager_test.sqlite3")
    @robot_manager ||= RobotManager.new(database)
  end

  def create_robots(num)
    num.times do |i|
      robot_manager.create({
        name: "Tron #{i + 1}",
        city: "Denver#{i + 1}",
        state: "CO#{i+1}",
        avatar: "avatar#{i + 1}",
        birthdate:"0#{i+1}/15",
        date_hired: "0#{ i + 1 }/15",
        department: "A#{i + 1}"
      })
    end
  end
end


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

  def create_robot(num)
    num.times do |i|
      robot_manager.create({
        :name       => Faker::StarWars.droid,
        :city       => Faker::Address.city,
        :state      => Faker::Address.state,
        :avatar     => Faker::Avatar.image,
        :birthdate  => Faker::Date.backward(500),
        :date_hired => Faker::Time.between(DateTime.now - 1, DateTime.now),
        :department => Faker::Commerce.department

      })
    end
  end
 end


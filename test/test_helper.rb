ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotWorldApp
Capybara.save_and_open_page_path = "tmp/capybara"


module TestHelper
  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    @database = YAML::Store.new("db/robot_manager_test")
    @robot_manager ||= RobotManager.new(database)
  end
end

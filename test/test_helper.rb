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

  def create_robots(num)
    num.times do |i|
      robot_manager.create({
        name: "Tron #{i + 1}",
        city: "Denver#{i + 1}",
        state: "CO#{i+1}",
        avatar: "avatar#{i + 1}",
        birthday:"0#{i+1}/15",
        date_hired: "0#{ i + 1 }/15",
        department: "A#{i + 1}"
      })
    end
  end
end

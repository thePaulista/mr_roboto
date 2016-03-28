require_relative '../test_helper'

class UserCanFindASpecificRobot< Minitest::Test
  include Capybara::DSL
  include TestHelper

  def test_user_can_see_one_robot
    create_robot(1)
    robot = robot_manager.all.last
    visit '/robots'

    click_link "#{robot.name}"
    assert_equal "/robots/'#{robot.id}'", current_path

    assert_equal page.has_content? "Department"
    assert_equal page.has_content? "Hired"
  end
end



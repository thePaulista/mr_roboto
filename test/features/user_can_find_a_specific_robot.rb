require_relative '../test_helper'

class UserCanFindASpecificRobot< Minitest::Test
  include Capybara::DSL
  include TestHelper

  def test_robot_can_be_created_with_correct_attributes
    create_robot(1)

    visit '/robots'

    click_link "#{robot.name}"
    assert_equal '/robots/"#{robot.id}"', current_path

    assert_equal page.has_content? "Department"
    assert_equal page.has_content? "Hired"
  end
end



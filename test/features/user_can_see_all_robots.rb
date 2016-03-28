require_relative '../test_helper'

class UserCanSeeAllRobot < Minitest::Test
  include Capybara::DSL
  include TestHelper

  def test_user_can_see_all_robots
    create_robot(3)
    visit '/robots'

    assert_equal '/robots', current_path

    within('h1') do
      assert page.has_content? 'Available Robots'
    end

    assert page.has_content? 'Robot ID 1'
    assert page.has_content? 'Robot ID 2'
    assert page.has_content? 'Robot ID 3'
  end
end


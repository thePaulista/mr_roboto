)require_relative '../test_helper'

class UserCanDeleteARobot < Minitest::Test
  include Capybara::DSL
  include TestHelper

  def test_robot_can_be_created_with_correct_attributes
    create_robot(1)
    visit '/robots'

    assert_equal '/robots', current_path
    assert page.has_content?("Available Robots")
    assert page.has_content? 'Robot ID 1'

    click_button("JunkYard")

    assert_equal '/robots', current_path
    refute page.has_content? 'Robot ID 1'
  end
end

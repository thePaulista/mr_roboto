require_relative '../test_helper'

class UserCanUpdateARobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_update_a_robot
    create_robot(1)
    id = robot_manager.all.last.id

    visit "/robots/#{id}/edit"

    fill_in 'robot[name]', with: 'BB-Cream'

    fill_in 'robot[city]', with: 'Cambridge'
    fill_in 'robot[state]', with: 'TX'
    click_button 'Recreate Robot'

    assert_equal "/robots/#{id}", current_path
    within('h1') do
      assert page.has_content? 'BB-Cream'
    end

    assert page.has_content? 'Cambridge
    assert page.has_content? 'TX'
  end
end

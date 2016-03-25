require_relative '../test_helper'

class UserCanCreateARobot < Minitest::Test
  include Capybara::DSL
  include TestHelper

  def test_robot_can_be_created_with_correct_attributes
    visit '/'

    click_button "Create Your Dream Robot"
    assert_equal '/robots/new', current_path

   # fill_in "robot[name]", with "Terminator"
   # fill_in "robot[city]", with "Denver"
   # fill_in "robot[state]", with "CO"
   # fill_in "robot[avatar]", with "robohash"
   # fill_in "robot[birthdate]", with "01/2014"
   # fill_in "robot[date_hired]", with "02/2014"
   # fill_in "robot[department]", with "Chess Player"

    click_button "Create Your Dream Robot In One Click"

    assert_equal '/robots', current_path
  end
end

#no boxes, now that i have a faker gem installed.


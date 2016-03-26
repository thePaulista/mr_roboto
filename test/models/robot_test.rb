require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({
                      :name => "terminator",
                      :city => "closet",
                      :state => "factory",
                      :avatar => "www.robothash.org",
                      :birthdate => "03/03/03",
                      :date_hired => "04/04/04",
                      :department => "kitchen"
    })

    assert_equal "terminator", robot.name
    assert_equal "closet", robot.city
    assert_equal "factory", robot.state
    assert_equal "www.robothash.org", robot.avatar
    assert_equal "03/03/03", robot.birthdate
    assert_equal "04/04/04", robot.date_hired
    assert_equal "kitchen", robot.department
  end
end

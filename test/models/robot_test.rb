require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly
    robot = Robot.new({
                      "name" => "terminator",
                      "city" => "closet",
                      "state" => "factory",
                      "avatar" => "www.robothash.org",
                      "birthdate" => "03/03/03",
                      "date_hired" => "04/04/04",
                      "department" => "kitchen"
    })

    assert_equal "terminator", robot.name
  end
end

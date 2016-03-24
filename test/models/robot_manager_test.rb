require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelper

  def test_it_can_create_a_robot
    create_robots(1)
    robot = robot_manager.all.last

    assert_equal 1, robot.id
    assert_equal "Tron 1", robot.name
    assert_equal "Denver1", robot.city
    assert_equal "CO 1", robot.state
    assert_equal "avatar 1", robot.avatar
    assert_equal "01/15", robot.birthdate
    assert_equal "01/15", robot.date_hired
    assert_equal "A 1", robot.department
  end

  def test_it_can_find_a_robot
    create_robots(3)

    robot = robot_manager.all.last

    assert_equal 3, robot_manager.all.count
    assert_equal 3, robot.id
    assert_equal "Tron 3", robot.name
    assert_equal "Denver 3", robot.city
    assert_equal "CO 3", robot.state
    assert_equal "avatar 3", robot.avatar
    assert_equal "03/15", robot.birthdate
    assert_equal "03/15", robot.date_hired
    assert_equal "A 3", robot.department
  end

  def test_it_can_update_a_robot

skip
  end
  def test_it_can_delete_a_robot

skip
  end
end

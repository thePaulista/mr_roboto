require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelper

  def test_it_can_create_a_robot
    zero = robot_manager.all

    assert_equal 0, zero.count

    create_robot(1)

   robot = robot_manager.all.last

   assert_equal "#{robot.name}", robot.name
   assert_equal "#{robot.city}", robot.city
   assert_equal "#{robot.state}", robot.state
   assert_equal "#{robot.avatar}", robot.avatar
   assert_equal "#{robot.birthdate}", robot.birthdate
   assert_equal "#{robot.date_hired}", robot.date_hired
   assert_equal "#{robot.department}", robot.department
  end

  def test_it_can_find_a_robot
    zero = robot_manager.all
    assert_equal 0, zero.count

   create_robot(3)

   robot_id = robot_manager.all.last
   robot = robot_manager.find(robot_id)
   assert_equal 3, robot.id
   assert_equal "#{robot.name}", robot.name
   assert_equal "#{robot.city}", robot.city
   assert_equal "#{robot.state}", robot.state
   assert_equal "#{robot.avatar}", robot.avatar
   assert_equal "#{robot.birthdate}", robot.birthdate
   assert_equal "#{robot.date_hired}", robot.date_hired
   assert_equal "#{robot.department}", robot.department
  end

  def test_it_can_update_a_robot
    zero = robot_manager.all
    assert_equal 0, zero.count

    create_robot(1)

    robot_id = robot_manager.all.last
    robot = robot_manager.find(robot_id)
    assert_equal 3, robot.id
    assert_equal "#{robot.name}", robot.name
    assert_equal "#{robot.city}", robot.city
    assert_equal "#{robot.state}", robot.state
    assert_equal "#{robot.avatar}", robot.avatar
    assert_equal "#{robot.birthdate}", robot.birthdate
    assert_equal "#{robot.date_hired}", robot.date_hired
    assert_equal "#{robot.department}", robot.department
  end

  def test_it_can_delete_a_robot
    zero = robot_manager.all
    assert_equal 0, zero.count

    create_robot(3)

    robot_id = robot_manager.all.last
    robot = robot_manager.find(robot_id)
    assert_equal 3, robot.id
    assert_equal "#{robot.name}", robot.name
    assert_equal "#{robot.city}", robot.city

    deleted = robot_manager.delete(robot_id)
    refute deleted, robot_manager.all
  end
end

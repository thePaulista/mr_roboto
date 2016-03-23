require 'yaml/store'
#require 'faker'
require_relative "robot"

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {"id"         => database["total"],
                             "name"       => database["name"],
                             "city"       => database["city"],
                             "state"      => database["state"],
                             "avatar"     => database["avatar"],
                             "birthday"   => database["birthday"],
                             "date_hired" => database["date_hired"],
                             "department" => database["department"]
                            }

    end
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot
    raw_robots.find {|robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.transaction do
      target = database["robots"].find { |data| data["id"] == id }
      target["name"]           = robot[:name]
      target["city"]           = robot[:city]
      target["state"]          = robot[:state]
      target["avatar"]         = robot[:avatar]
      target["birthday"]       = robot[:birthday]
      target["date_hired"]     = robot[:date_hired]
      target["department"]     = robot[:department]
    end
  end

  def delete(id)
    database.transaction do
      database["tasks"].delete_if { |robot| robot["id"] == id.to_i }
    end
  end

  def delete_all
    database.transaction do
      database["robots"] = []
      database["total"] = 0
    end
  end
end



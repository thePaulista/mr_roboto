require 'yaml/store'
require 'faker'
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
                             "name"       => Faker::StarWars.droid,
                             "city"       => Faker::Address.city,
                             "state"      => Faker::Address.state,
                             "avatar"     => Faker::Avatar.image,
                             "birthday"   => Faker::Date.backward(500),
                             "date_hired" => Faker::Date.backward(300),
                             "department" => Faker::Commerce.department
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
    raw_robots.find {|robot| robot["id"] == id.to_i }
  end

  def find(id)
    Robot.new(raw_robot(id.to_i))
  end

  def update(id, robot)
    database.transaction do
      target = database["robots"].find { |data| data["id"] == id.to_i }
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



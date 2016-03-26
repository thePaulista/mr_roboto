require 'faker'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def dataset
    database.from(:robots)
  end

  def create(robot)
    robot =  {
      "name"       => Faker::StarWars.droid,
      "city"       => Faker::Address.city,
      "state"      => Faker::Address.state,
      "avatar"     => Faker::Avatar.image,
      "birthdate"  => Faker::Date.backward(500),
      "date_hired" => Faker::Time.between(DateTime.now - 5, DateTime.now),
      "department" => Faker::Commerce.department
    }

  dataset.insert(robot)
  end

  def all
    dataset.all.to_a.map { |data| Robot.new(data) }
  end

  def find(id)
    require "pry"; binding.pry
    data = dataset.where(:id => id).to_a.first

    Robot.new(data)
  end

  def update(id, robot)
    dataset.where(:id => id).update(robot)
  end

  def delete(id)
    dataset.where(:id => id).delete
  end
end



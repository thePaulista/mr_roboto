require 'faker'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def dataset
    database.from(:robots)
  end

  def terminator(robot)
    robot =  {
      "name" => Faker::StarWars.droid,
      "city"       => Faker::Address.city,
      "state"      => Faker::Address.state,
      "avatar"     => Faker::Avatar.image,
      "birthdate"  => Faker::Date.backward(500),
      "date_hired" => Faker::Time.between(DateTime.now - 5, DateTime.now),
      "department" => Faker::Commerce.department
    }
  end

  def create(robot)
    dataset.insert(terminator(robot))
  end

  def all
    dataset.all.to_a.map { |data| Robot.new(data) }
  end

  def find(id)
    data = dataset.where(:id => id).to_a.first
    Task.new(data)
  end

  def update(id, robot)
    dataset.where(:id => id).update(robot)
  end

  def delete(id)
    dataset.where(:id => id).delete
  end

  def delete_all
    dataset.delete
  end

end



require 'sequel'
environments = ["test", "development"]

environments.each do |env|
     Sequel.sqlite("db/robot_manager_#{env}.sqlite3").create_table(:robots) do
       primary_key :id
       String  :name
       String  :city
       String  :state
       String  :avatar
       String  :birthdate
       String  :date_hired
       String  :department
     end
end

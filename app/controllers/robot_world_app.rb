class RobotWorldApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_manager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    id = id.to_i
    robot_manager.update(id, params[:robot])
    @robot = robot_manager.find(id)
    redirect "/robots/#{@robot.id}"
  end

  delete "/robots/:id" do |id|
    robot_manager.delete(id.to_i)
    redirect '/robots'
  end

  not_found do
    erb :error
  end

  def robot_manager
    database = YAML::Store.new('db/robot_manager')
    @robot_manager ||= RobotManager.new(database)
  end
end



class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "my_application_secret"
    enable :sessions
  end

  get "/" do
    erb :welcome
  end

  get '/registrations/signup' do 

    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/home'
  end

  get '/sessions/login' do 
    erb :'/sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/login'
    end

    get '/sessions/logout' do
      session.clear
      redirect '/'
    end

    get '/users/home' do
      @user = User.find(session[:user_id])
      erb :'/users/home'
    end
end
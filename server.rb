require 'sinatra'
require 'sinatra/reloader'
require 'uri'
require 'pry'
require_relative('./lib/movie_finder.rb')
require_relative('./lib/user.rb')
require_relative('./lib/question_selector.rb')

enable(:sessions)

movies = MovieFinder.new
question_selector = QuestionSelector.new
movies_info = []
message = ""

get '/' do
	redirect('/new_search')
end	

get '/new_search' do
	erb :new_search, layout: :sinatra_layout
end

post '/new_search' do	
 	movies_info = movies.get_movies_info(params[:term])
 	redirect('/movies')
end

get '/movies' do
	@movies_info = movies_info
	@question_selector = question_selector
	@value = question_selector.generate_value(movies_info)	
	erb :movies, layout: :sinatra_layout
end

post '/movies' do
	@movies_info = blog.latest_posts
	erb :posts, layout: :sinatra_layout
end	

get '/movie_details/:id' do
  @movie = blog.find_movie_by_id(params[:id])
  erb :movie_details, layout: :sinatra_layout
end

get "/login" do
	erb :login,layout: :sinatra_layout
end

post '/login' do
  	user = User.new(params[:username], params[:password])
  	valid_user = User.valid_credentials? user
  	if valid_user
    	session[:user] = user.name
    	message = "Welcome, #{user.name}!"    
  	else
  		message = "Wrong credentials"    
  	end
  	redirect("/profile")
end


get '/profile' do
	@message = message
 	erb :profile, layout: :sinatra_layout
end


get '/logout' do
 	session[:user] = nil
 	redirect("/login")
end
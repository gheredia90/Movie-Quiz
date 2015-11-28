require 'pry'
require 'imdb'

class MovieFinder

	def get_movies_info(term)
		sum = 0
		search = Imdb::Search.new(term)
		movies_info = []
		search.movies.each do |movie|
			if (!movie.poster.nil?) && (sum < 9) && (!movie.year.nil?)			
				movies_info << {:title => movie.title, :year => movie.year, :poster => movie.poster, :cast_members => movie.cast_members}
				sum += 1
			end
			if sum == 9 
				break
			end	
		end 
		movies_info   	
	end	

end
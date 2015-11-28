require_relative "../lib/movie_finder.rb"
require_relative "./spec_helper.rb"

describe MovieFinder do

	describe "#shazam" do

	    before :each do
	       @lexi = MovieFinder.new
	    end

	    it "returns a 9-position array" do
	    	imdb_catalog = instance_double("MovieFinder", :get_movies_info => Array.new(9))
	    	expect(imdb_catalog.get_movies_info("hook").size).to eq(9)
	  	end	 

	  	it "returns a 0-position array" do
	    	imdb_catalog = instance_double("MovieFinder", :get_movies_info => [])
	    	expect(imdb_catalog.get_movies_info("")).to eq([])
	  	end	   


	  	it "returns a 0-position array" do
	    	imdb_catalog = instance_double("MovieFinder", :get_movies_info => [])
	    	expect(imdb_catalog.get_movies_info("")).to eq([])
	  	end	 
	     
	end

end

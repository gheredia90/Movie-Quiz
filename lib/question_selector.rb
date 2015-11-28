class QuestionSelector

	attr_reader :question
		

	def sample
		value = [1,2].sample
		if value == 1
			@question = {:body => "Which one was filmed in ", :value => "year"}
		else
			@question = {:body => "Which one had this cast member ", :value => "cast_member"}
		end			
	end

	def generate_value(movies_info)
		self.sample
		sample_year = movies_info.sample[:year]
		sample_cast_member = movies_info.sample[:cast_members].sample
		if @question[:value] == "year"
			value = sample_year 
		else 
			value = sample_cast_member
		end
		value
	end	

	def generate_message(movie, value)
		if value.class == "Fixnum"
			message = movie[:year] == value ? "Correct!" : "Wrong choice!"
		else
			message = movie[:cast_members].include?(value) ? "Correct!" : "Wrong choice!"
		end	
		message
	end	

end
require "pry"

class Player
	attr_accessor :name
	@name= ""
	@number_of_win = 0
	@number_of_egality = 0

	def initialize(name)
		print "name of gamer : "
		@name = gets.chomp
	end

	def return_name
		@name
	end

	def increments_number_of_win
		@number_of_win
		if @name == win
			@number_of_win +=
		end
	end

	def increments_number_of_egality
		@number_of_egality
		if @name == egality
			@number_of_egality +=
			puts "Egalité"
		end
	end

	def return_number_of_win
		@return_number_of_win
	end
end


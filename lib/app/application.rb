class Application
	attr_accessor :number_of_part
	

	def initialize
		game = game.new
		@number_of_part = 0
	end

	def start_game
		game.play
	end

	def incrementes_number_of_part
		@number_of_part = @number_of_part + 1
	end

	def ask_replay
		puts "Voulez vous rejouer ? OUI ou NON"
		replay = gets.chomp
		if replay.upcase == "OUI"
			start_game
		else
			exit_game
		end
	end

	def exit_game
		
	end
end
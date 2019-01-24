require "./lib/app/player.rb"
require "./lib/app/board.rb"

class Game
	def initialize
		@board_case = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "}
		player_one = Player.new
		player_two = Player.new
		play
	end

	def play
		board = Board.new
		for i in 1..10
			board.display_board(@board_case)
			select_board_case
		end
	end

	def select_board_case
		puts "Choisisez la case sur laquel vous voulez jouer.\n Si par exemple vous voulez jouer sur la premiere case ecrivez \"A1\""
		case_choosed = gets.chomp.upcase
		if case_choosed[0] =~ /[A-Z]/

		test = @board_case.fetch(case_choosed)
		# puts "la valeur est #{test.class}"
		if test == " "
			puts "SA PASSE "
		elsif test == "O" || test == "X"
			puts "sa passe aussi"
		else
			puts "ERROR"
		end
	end

	# def modif_board_case()

	# end

	def is_win
		
	end
end

test = Game.new
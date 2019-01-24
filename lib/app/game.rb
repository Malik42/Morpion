require "./lib/app/player.rb"
require "./lib/app/board.rb"

class Game
	def initialize
		@board_case = {"A1" => "O", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "}
		print "name of gamer 1: "
		player_one = Player.new
		print "name of gamer 2: "
		player_two = Player.new
		play
	end

	def play
		board = Board.new
		for i in 1..9
			board.display_board(@board_case)
			select_board_case
		end
	end

	def select_board_case
		valide_choice = 0

		while valide_choice == 0
			puts "Choisisez la case sur laquel vous voulez jouer.\n Si par exemple vous voulez jouer sur la premiere case ecrivez \"A1\""
			case_choosed = gets.chomp.upcase
			if (case_choosed[0] =~ /[A-C]/) != 0
				case_choosed.reverse!
			end

			if ((case_choosed[0] == 'A' || case_choosed[0] == 'B' || case_choosed[0] == 'C') && (case_choosed[1] == '1' || case_choosed[1] == '2' || case_choosed[1] == '3')) && case_choosed.length == 2 && @board_case.fetch(case_choosed) == " "
				valide_choice = 1
			end
		end
		
		# test = @board_case.fetch(case_choosed)
		# # puts "la valeur est #{test.class}"
		# if test == " "
		# 	puts "SA PASSE "
		# elsif test == "O" || test == "X"
		# 	puts "sa passe aussi"
		# else
		# 	puts "ERROR"
		# end
	end

	# def modif_board_case()

	# end

	def is_win
		
	end
end

test = Game.new
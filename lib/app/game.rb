require "./lib/app/player.rb"
require "./lib/app/board.rb"

class Game
	def initialize
		@who_play = 0
		@board_case = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "}
		print "name of gamer 1: "
		player_one = Player.new
		print "name of gamer 2: "
		player_two = Player.new
		play
	end

	def play
		board = Board.new
		
		if @who_play == 0
			@who_play == rand(1..2)
		end

		for i in 1..9
			board.display_board(@board_case) if i == 1
			select_board_case
			board.display_board(@board_case)
			if @who_play == 1
				@who_play = 2
			else
				@who_play = 1
			end
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

			if !(@board_case.has_value?(" "))
				valide_choice = 1
			end
			# if (@board_case['A1'] != " " && @board_case['A2'] != " " && @board_case['A3'] != " " && @board_case['C1'] != " " && @board_case['C2'] != " " && @board_case['C3'] != " " && @board_case['A1'] != " " && @board_case['A1'] != " " &&)
		end
		modif_board_case(case_choosed)
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

	def modif_board_case(str)
		if @who_play == 1
			@board_case[str] = 'X'
		else
			@board_case[str] = 'O'
		end
	end

	def is_win
		
	end
end

test = Game.new
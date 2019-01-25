require "./lib/app/player.rb"
require "./lib/app/board.rb"

class Game
	def initialize
		@who_play = rand(1..2) # Genere un nombre aleatoire entre 1 et 2 pour decider qui commence la partie entre le joueur 1 et 2
		@board_case = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "} # c'est les cases du plateau
		print "name of gamer 1: ".colorize(:blue) # affiche une phrase qui demande  au joueur son nom
		@player_one = Player.new # cree une instance de la class player
		print "name of gamer 2: ".colorize(:blue) # affiche une phrase qui demande  au joueur son nom
		@player_two = Player.new # cree une instance de la class player
	end

	# la methode play gere tout le jeux

	def play
		board = Board.new # cree une instance de la class board
		for i in 1..9 # fait une boucle qui vas de 1 a 9, quand on arrive a 9 ca veut dire que toutes les cases du tableau on ete remplis. 
			board.display_stat(@player_one.return_name, @player_two.return_name, @player_one.return_number_of_win, @player_two.return_number_of_win, @player_two.return_number_of_egality) # on appel la methode display stats qui vas servire a affichier les statistiques, nombre de parties, nom des joueurs, leur nombre de victoires...
			if @who_play == 1 # on cree une condition qui vas servire a afficher le nom du joueur qui doit jouer ce tours.
				puts "A toi de jouer #{@player_one.return_name.colorize(:green)} !\n\n\n"
			else
				puts "A toi de jouer #{@player_two.return_name.colorize(:green)} !\n\n\n"
			end
			board.display_board(@board_case) # on affiche le plateau du jeux
			select_board_case # on appel la methode qui demande a l'utilisateur de choisire la case sur laquel il vas jouer
			if is_win == true # on fait une condition qui appel la methode is_win, cette methode verifi si il y a un cas de victoire
				board.display_board(@board_case) # on affiche le plateau une derniere fois pour montrer la derniere modification
				if @who_play == 1 # on fait une condition qui verifie qui a gagner
					puts "le joueur #{@player_one.return_name} a gagner cette partie!" # si c'est le joueur 1 qui a gagner on dit qu'il a gagner, on affiche son nom
					@player_one.increments_number_of_win	# on incremente du nombre de victoire 
				else
					puts "le joueur #{@player_two.return_name} a gagner cette partie!"
					@player_two.increments_number_of_win
				end
				break # On quitte la boucle car il y a eu une victoire
			end
			@who_play == 1 ? @who_play = 2 : @who_play = 1 # cette ligne sert a faire que c'est a l'autre joueur de jouer (c'est une condition de type ternaire)
		end
		if is_win == false # si on sort de la boucle et qu'il n'y a aucune victoire alor c'est un match nul
			@player_one.increments_number_of_egality # on incremente la variable qui compte le nombres de matchs nuls
			@player_two.increments_number_of_egality
			puts "MATCH NULLLLLLL".colorize(:red) # on affiche que c'est un match nul
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
		end
		modif_board_case(case_choosed)
	end

	def modif_board_case(str)
		if @who_play == 1
			@board_case[str] = 'X'
		else
			@board_case[str] = 'O'
		end
	end

	def is_win
		game_win = false
		if (@board_case["A1"] == @board_case["A2"] && @board_case["A2"] == @board_case["A3"] && @board_case["A1"] != " ") ||
			(@board_case["B1"] == @board_case["B2"] && @board_case["B2"] == @board_case["B3"] && @board_case["B1"] != " ") ||
			(@board_case["C1"] == @board_case["C2"] && @board_case["C2"] == @board_case["C3"] && @board_case["C1"] != " ") ||
			(@board_case["A1"] == @board_case["B1"] && @board_case["B1"] == @board_case["C1"] && @board_case["A1"] != " ") ||
			(@board_case["A2"] == @board_case["B2"] && @board_case["B2"] == @board_case["C2"] && @board_case["A2"] != " ") ||
			(@board_case["A3"] == @board_case["B3"] && @board_case["B3"] == @board_case["C3"] && @board_case["A3"] != " ") ||
			(@board_case["A1"] == @board_case["B2"] && @board_case["B2"] == @board_case["C3"] && @board_case["A1"] != " ") ||
			(@board_case["A3"] == @board_case["B2"] && @board_case["B2"] == @board_case["C1"] && @board_case["A3"] != " ")
			game_win = true
		end
		game_win
	end

	def init_board_case
		@board_case = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "}
	end
end

# test = Game.new
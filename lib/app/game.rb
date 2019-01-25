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

	# On cree une methode qui demande a l'utilisateur de choisire une case

	def select_board_case
		valide_choice = 0 # on cree une variable qui vas nous servir de flag pour la boucle, on fera une boucle infini jusqu'a ce que cette variable soit egale a 1

		while valide_choice == 0
			puts "Choisisez la case sur laquel vous voulez jouer.\n Si par exemple vous voulez jouer sur la premiere case ecrivez \"A1\""
			case_choosed = gets.chomp.upcase # on recupere ca case que l'utilisateur a choisi de jouer et on la met en majuscule (sa permet au joueur de pouvoir selectionner une lettre minuscule)
			if (case_choosed[0] =~ /[A-C]/) != 0 # si le premier caractere n'es pas une lettre entre A et C (regex) on rentre dans la condition
				case_choosed.reverse! # et on inverse la chaine de caractere (comme sa si l'utilisateur a mis 1A alor le programme ici transforme en A1)
			end

			# on fait une condition qui test si la case selectionner par l'utilisateur est vide ou pas, si elle a deja ete prise ou que l'utilisateur rentre n'importe quoi alor il vas boucler temp qu'il ne choisi pas une case vide
			if ((case_choosed[0] == 'A' || case_choosed[0] == 'B' || case_choosed[0] == 'C') && (case_choosed[1] == '1' || case_choosed[1] == '2' || case_choosed[1] == '3')) && case_choosed.length == 2 && @board_case.fetch(case_choosed) == " "
				valide_choice = 1 # si l'utilisateur remplis toutes les conditions ca veut dire qu'il a selectionner une case valide on lui permet de sortir de la boucle
			end

			if !(@board_case.has_value?(" ")) # si aucune case de notre hash board_case n'es vide alor toute les cases on ete remplie, on permet a l'utilisateur de sortir de la boucle
				valide_choice = 1
			end
		end
		modif_board_case(case_choosed) # on appel la class qui modifie le hash Board_case
	end

	# on remplis notre hash avec des X et des O en fonction du tour de jeux

	def modif_board_case(str) # la methode prend la key du hash a modifier en parametre ("A1" par exemple)
		if @who_play == 1 # si c'est le joueur 1 qui a jouer pendant ce tour de jeux alor on remplis le hash avec une croix ("X")
			@board_case[str] = 'X'
		else # sinon on remplis la case du tableau avec un rond ("O")
			@board_case[str] = 'O'
		end
	end

	# Cette methode verifi tout les cas de victoire

	def is_win
		game_win = false # on cree une variable Game_win qui vaux false par default
		# si une des 8 condition de victoire est bonne alor on la variable game_win devien egale a true
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
		game_win # on renvoi la valeur de la variable qui indique si il y a un cas de victoire sur le plateau ou pas
	end

	# on cree une class qui vas vider toutes les cases du tableau, c'est utile quand on relance une nouvelle partie

	def init_board_case
		@board_case = {"A1" => " ", "A2" => " ", "A3" => " ", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "}
	end

	# cette methode affiche qui a gagner la partie, si il y a match nul ou pas...

	def display_winner
		if @player_one.return_number_of_win > @player_two.return_number_of_win # on fait une condition qui compare le nombre de victoire des joueurs pour savoir lequel a gagner la partie
			puts "\n\n\nBravo #{@player_one.return_name.colorize(:green)} Vous avez battu #{@player_two.return_name.colorize(:red)}"
		elsif @player_one.return_number_of_win < @player_two.return_number_of_win
			puts "\n\n\nBravo #{@player_two.return_name.colorize(:green)} Vous avez battu #{@player_one.return_name.colorize(:red)}"
		else
			puts "\n\n\nBravo #{@player_two.return_name.colorize(:blue)} et #{@player_one.return_name.colorize(:blue)} Vous avez fait un match nul!"
		end
	end
end

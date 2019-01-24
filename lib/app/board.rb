require 'colorize'
require "./lib/app/player.rb"
require "./lib/app/game.rb"
# Classe Board : La class Board sert à afficher
#
# Variable : Possède aucune variable
#
# Method : Possède une Method "display_board" qui prend en paramètre un hash

class Board

  # Method : display_board
  # Paramètre : la method prend un hash en paramètre qu'on lui donnera dans la classe game
  # Description : La method gère l'affichage de la grille avec les valeur dans les case

  def display_board(hash)
    puts "      1       2       3".colorize(:white)
    puts "  *************************".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "A".colorize(:white) + " *   #{hash.fetch("A1")}   |   #{hash.fetch("A2")}   |   #{hash.fetch("A3")}   *".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "  *-----------------------*".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "B".colorize(:white) + " *   #{hash.fetch("B1")}   |   #{hash.fetch("B2")}   |   #{hash.fetch("B3")}   *".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "  *-----------------------*".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "C".colorize(:white) + " *   #{hash.fetch("C1")}   |   #{hash.fetch("C2")}   |   #{hash.fetch("C3")}   *".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "  *************************".colorize(:blue)
  end

  def display_stat(player_one_name, player_two_name, number_of_win_one, number_of_win_two, number_of_egality)
    puts "Joueur : #{@player_one.return_name}, Nombre de win : #{@player_one.return_number_of_win}"
		puts "Joueur : #{@player_two.return_name}, Nombre de win : #{@player_two.return_number_of_win}"
  end
end

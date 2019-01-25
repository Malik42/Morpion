require 'colorize'
require "./lib/app/player.rb"
require "./lib/app/game.rb"
# Classe Board : La class Board sert à afficher
#
# Variable : Possède aucune variable
#
# Method : Possède une Method "display_board" qui prend en paramètre un hash et une method display stat qui affiche le nom des joueur et leur nombre de win 

class Board

  # Method : display_board
  # Paramètre : la method prend un hash en paramètre qu'on lui donnera dans la classe game
  # Description : La method gère l'affichage de la grille avec les valeur dans les case
  # Affiche le plateau

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

  # Method : display_stat
  # Paramètre : La méthode prendre le nom des 2 joueurs, les parties gagnés des joueurs et leurs parties nulles
  # Description : La méthode additionnes les parties entres joueurs pour leur afficher le nombre de partie jouer
  def display_stat(player_one_name, player_two_name, number_of_win_one, number_of_win_two, number_of_egality)
    number_of_part = number_of_win_one + number_of_win_two + number_of_egality
    puts " "
    puts " "
    # dans les deux prochain puts on fait une ternaire qui vas colorier en rouge le score plus plus petit et en vert le score le plus haut
    puts "Joueur : #{player_one_name.colorize(:blue)}, Nombre de win : #{number_of_win_one >= number_of_win_two ? number_of_win_one.to_s.colorize(:green) : number_of_win_one.to_s.colorize(:red)}"
    puts "Joueur : #{player_two_name.colorize(:blue)}, Nombre de win : #{number_of_win_two >= number_of_win_one ? number_of_win_two.to_s.colorize(:green) : number_of_win_two.to_s.colorize(:red)}"
    if number_of_part == 0
      puts "Ceci est votre première partie"
    else
      puts "Vous avez jouer #{number_of_win_one + number_of_win_two + number_of_egality} fois"
    end
    puts " "
    puts " "
  end
end

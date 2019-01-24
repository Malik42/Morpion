require 'colorize'
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
    puts "      1       2       3"
    puts "  *************************".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "A *   #{hash.fetch("A1")}   |   #{hash.fetch("A2")}   |   #{hash.fetch("A3")}   *".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "  *-----------------------*".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "B *   #{hash.fetch("B1")}   |   #{hash.fetch("B2")}   |   #{hash.fetch("B3")}   *".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "  *-----------------------*".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "C *   #{hash.fetch("C1")}   |   #{hash.fetch("C2")}   |   #{hash.fetch("C3")}   *".colorize(:blue)
    puts "  *       |       |       *".colorize(:blue)
    puts "  *************************".colorize(:blue)
  end
end

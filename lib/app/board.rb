class Board
  def display_board(hash)
    puts "      1       2       3"
    puts "  *************************"
    puts "  *       |       |       *"
    puts "A *   #{hash.fetch("A1")}   |   #{hash.fetch("A2")}   |   #{hash.fetch("A3")}   *"
    puts "  *       |       |       *"
    puts "  *-----------------------*"
    puts "  *       |       |       *"
    puts "B *   #{hash.fetch("B1")}   |   #{hash.fetch("B2")}   |   #{hash.fetch("B3")}   *"
    puts "  *       |       |       *"
    puts "  *-----------------------*"
    puts "  *       |       |       *"
    puts "C *   #{hash.fetch("C1")}   |   #{hash.fetch("C2")}   |   #{hash.fetch("C3")}   *"
    puts "  *       |       |       *"
    puts "  *************************"
  end
end

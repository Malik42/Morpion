class Board
<<<<<<< HEAD
  def display_board(hash)
    puts "       |       |"
    puts "   #{hash.fetch("A1")}   |   #{hash.fetch("A2")}   |   #{hash.fetch("A3")}"
    puts "       |       |"
    puts "-----------------------"
    puts "       |       |"
    puts "   #{hash.fetch("B1")}   |   #{hash.fetch("B2")}   |   #{hash.fetch("B3")}"
    puts "       |       |"
    puts "-----------------------"
    puts "       |       |"
    puts "   #{hash.fetch("C1")}   |   #{hash.fetch("C2")}   |   #{hash.fetch("C3")}"
    puts "       |       |"
  end
=======
  def display_board
>>>>>>> 8eaac2d9b0cc77f8124de660d433fe5e35202372

  def puts_hello
    puts "hello"
  end
end


test = Board.new

test.display_board({"A1"=>"X", "A2" => "O", "A3" => "X", "B1" => " ", "B2" => " ", "B3" => " ", "C1" => " ", "C2" => " ", "C3" => " "})
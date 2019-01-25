require 'bundler'
Bundler.require

$:.unshift File.expand_path("./lib/app", __FILE__)

def game_again
	while true

		puts "Bienvenue dans le menu"
		puts "1. Démarrer une partie"
		puts "2. Quitter le Game"
		continued = gets.chomp.to_i

		case continued
		when 1
			puts "La partie démarre"
			game = Application.new
		when 2
			puts "Merci et à bientôt"
			break
		else
			puts "Error"
		end
	end
end

game_again
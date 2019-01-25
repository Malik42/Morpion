# Recupère toute les gem

require 'bundler'
Bundler.require

# Recupère toute les classe

$:.unshift File.expand_path("./lib/app", __FILE__)

# Method qui commence le jeu

def game_again
	while true

		# On demande a l'utilisateur ce qu'il veut faire

		puts "Bienvenue dans le menu"
		puts "1. Démarrer une partie"
		puts "2. Quitter le Game"
		continued = gets.chomp.to_i

		case continued
		when 1
			# On demarre la partie
			puts "La partie démarre"
			game = Application.new
		when 2
			# si l'utilisateur ne veut pas jouer on quitte l'interface
			puts "Merci et à bientôt"
			break
		else
			# Si il entre autre chose que 1 ou 2 on renvoi une erreur
			puts "Error"
		end
	end
end

# On lance le programme

game_again
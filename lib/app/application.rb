require "./lib/app/game.rb"
# Classe Application : La class Application sert à créer 
#
# Variable : Possède des varibles d'instances :
# - "number_of_part" qu'on mais en attr_accessor pour avoir les droits d'ecriture et de lecture dessus cette variable va servir a recupéré le nombre de partie jouer
#
# Method : Possède plusieurs method :
# - "initialize" : cette method sert a initialiser l'objet, dans cette method on appel la classe game pour commencer une partie
# - "start_game" : cette method lance une partie a partir de class game
# - "incrementes_number_of_part" : cette method incremente le nombre de partie jouer
# - "ask_replay" : cette method demande si l'utilisateur veux rejouer
# - "exit_game" : cette method quitte le jeu

class Application

	# Variables :

	attr_accessor :number_of_part # Nombre de partie jouer avec le droit d'ecriture et de lecture

	# Method : initialize
  # Paramètre : Ne prend aucun paramètre
  # Description : La method initialise l'objet game et initialise le nombre de partie a 0
	
	def initialize
		@game = Game.new
		@number_of_part = 0
		start_game
	end

	# Method : start_game
  # Paramètre : Ne prend aucun paramètre
  # Description : La method commence une partie

	def start_game
		@game.play
		ask_replay
	end

	# Method : incrementes_number_of_part
  # Paramètre : Ne prend aucun paramètre
  # Description : La method incrémente le nombre de partie jouer

	def incrementes_number_of_part
		@number_of_part = @number_of_part + 1
	end

	# Method : ask_replay
  # Paramètre : Ne prend aucun paramètre
  # Description : La method demande au joeur si il vaut rejouer ou non

	def ask_replay
		puts "Voulez vous rejouer ? OUI ou NON"
		replay = gets.chomp
		if replay.upcase == "OUI"
			@game.init_board_case
			start_game
		else
			exit_game
		end
	end

	# Method : exit_game
  # Paramètre : Ne prend aucun paramètre
  # Description : La method quitte le jeu

	def exit_game
		puts "Au revoir"
	end
end

test = Application.new
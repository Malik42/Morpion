# Classe Board : La class Board sert à créer les joueur
#
# Variable : Possède des varibles d'instances :
# - "name" qu'on mais en attr_accessor pour avoir les droits d'ecriture et de lecture dessus cette variable va servir a recupéré le nom de l'utilisateur
# - "@number_of_win" cette variable va nous servir a compter le nombre de win du joueur
# - "@number_of_egality" cette variable va nous servir a compter le nombre de parti nul du joueur
#
# Method : Possède plusieurs method :
# - "initialize" : cette method sert a initialiser l'objet et on demande au joueur de rentre son nom
# - "return_name" : cette method retourne le nom du joueur
# - "increments_number_of_win" : cette method ajoute une victoire au joueur si il a gagnez
# - "increments_number_of_egality" : cette method ajoute une egalité au joueur si il a fait un null
# - "return_number_of_win" : cette method retourne le nombre de victoire

class Player
	# Variables :

	attr_accessor :name # Nom du joueur avec le droit d'ecriture et de lecture
	@number_of_win = 0 # Nombre de partie gagnez
	@number_of_egality = 0 # Nombre de partie egalité

	# Method : initialize
  # Paramètre : Ne prend aucun paramètre
  # Description : La method initialise l'objet et demande a l'utilisateur de rentrez son nom

	def initialize
		@name = gets.chomp-
	end

	# Method : return_name
  # Paramètre : Ne prend aucun paramètre
  # Description : La method retourne le nom du joueur

	def return_name
		@name
	end

	# Method : increments_number_of_win
  # Paramètre : Ne prend aucun paramètre
  # Description : La method sert a incrémenté la variable number_of_win à chaque victoire

	def increments_number_of_win
		if @name == win
			@number_of_win += 1
		end
	end

	# Method : increments_number_of_egality
  # Paramètre : Ne prend aucun paramètre
  # Description : La method sert a incrémenté la variable number_of_egality à chaque match null

	def increments_number_of_egality
		if @name == egality
			@number_of_egality += 1
			puts "Egalité"
		end
	end

	# Method : return_number_of_win
  # Paramètre : Ne prend aucun paramètre
  # Description : La method retourne le nombre de victoire du joueur

	def return_number_of_win
		@number_of_win
	end
end

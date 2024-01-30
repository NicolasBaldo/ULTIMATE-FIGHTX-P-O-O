require_relative 'lib/player'
require_relative 'lib/game.rb'
require 'bundler'
Bundler.require 


puts "************************************************************"
puts "*                                                          *"
puts "*                   ULTIMATE FIGHT X                       *"
puts "*                                                          *"
puts "*           ------{}::::::::::::::::::::>                  *"
puts "*                                                          *"
puts "*                ONLY ONE CAN SURVIVE                      *"
puts "*                                                          *"
puts "*           ------{}::::::::::::::::::::>                  *"
puts "*                                                          *"
puts "************************************************************"

print "Entrez votre prénom : "
user_name = gets.chomp

my_game = Game.new(user_name)

puts "************************************************************"
puts "*                                                          *"
puts "*                 !  NEW CHALLENGER  !                     *"
puts "*                                                          *"
puts "*           ------{}::::::::::::::::::::>                  *"
puts "*                                                          *"
puts "*  Welcome #{my_game.human_player.name}! Prépare-toi à SAIGNER ! *"
puts "************************************************************"

puts "************************************************************"
puts "*           QUELLE ACTION VEUX-TU EFFECTUER ?              *"
puts "*                                                          *"
puts "*         w - Chercher une meilleure arme                  *"
puts "*         m - Prendre un Medipack                          *"
puts "*         0 - Attaquer Schwarzy                            *"
puts "*         1 - Attaquer Stallone                            *"
puts "*         p - Attaquer les Predators                       *"
puts "*                                                          *"
puts "************************************************************"
print "> "


# Définition de la méthode get_player_action
def get_player_action
gets.chomp
end

player_action = get_player_action

# Traitement de l'action du joueur
case player_action
when "w"
  puts "Tu cherches une meilleure arme."
  # Ajoutez ici le code pour traiter la recherche d'une meilleure arme.
when "m"
  puts "Tu prends un Medipack."
  # Ajoutez ici le code pour traiter la prise d'un Medipack.
when "0"
  puts "Tu attaques Schwarzy."
  # Ajoutez ici le code pour traiter l'attaque contre Schwarzy.
when "1"
  puts "Tu attaques Stallone."
  # Ajoutez ici le code pour traiter l'attaque contre Stallone.
when "p"
  puts "Tu attaques les Predators."
  # Ajoutez ici le code pour traiter l'attaque contre les Predators.
  puts "Les Predators ripostent !"
  # Ajoutez ici le code pour traiter la riposte des Predators.
else
  puts "Action non reconnue. Choisis une action valide."
end

while my_game.is_still_ongoing?
  my_game.new_players_in_sight
  my_game.show_players

  puts my_game.human_player.show_state

  my_game.menu
  choice = gets.chomp
  my_game.menu_choice(choice)

  my_game.enemies_attack

  puts my_game.human_player.show_state
end

my_game.game_over_message
puts ascii_image = "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⠀⠀⠀⢀⣴⣿⡶⠀⣾⣿⣿⡿⠟⠛⠁
⠀⠀⠀⠀⠀⠀⣀⣀⣄⣀⠀⠀⠀⠀⣶⣶⣦⠀⠀⠀⠀⣼⣿⣿⡇⠀⣠⣿⣿⣿⠇⣸⣿⣿⣧⣤⠀⠀⠀
⠀⠀⢀⣴⣾⣿⡿⠿⠿⠿⠇⠀⠀⣸⣿⣿⣿⡆⠀⠀⢰⣿⣿⣿⣷⣼⣿⣿⣿⡿⢀⣿⣿⡿⠟⠛⠁⠀⠀
⠀⣴⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⢠⣿⣿⣹⣿⣿⣿⣿⣿⣿⡏⢻⣿⣿⢿⣿⣿⠃⣼⣿⣯⣤⣴⣶⣿⡤⠀
⣼⣿⠏⠀⣀⣠⣤⣶⣾⣷⠄⣰⣿⣿⡿⠿⠻⣿⣯⣸⣿⡿⠀⠀⠀⠁⣾⣿⡏⢠⣿⣿⠿⠛⠋⠉⠀⠀⠀
⣿⣿⠲⢿⣿⣿⣿⡿⠋⢰⣿⣿⠋⠀⠀⠀⢻⣿⣿⣿⠇⠀⠀⠀⠀⠙⠛⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀
⠹⢿⣷⣶⣿⣿⠿⠋⠀⠀⠈⠙⠃⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣴⣶⣦⣤⡀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⣠⡇⢰⣶⣶⣾⡿⠷⣿⣿⣿⡟⠛⣉⣿⣿⣿⠆
⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⡎⣿⣿⣦⠀⠀⠀⢀⣤⣾⠟⢀⣿⣿⡟⣁⠀⠀⣸⣿⣿⣤⣾⣿⡿⠛⠁⠀
⠀⠀⠀⠀⣠⣾⣿⡿⠛⠉⢿⣦⠘⣿⣿⡆⠀⢠⣾⣿⠋⠀⣼⣿⣿⣿⠿⠷⢠⣿⣿⣿⠿⢻⣿⣧⠀⠀⠀
⠀⠀⠀⣴⣿⣿⠋⠀⠀⠀⢸⣿⣇⢹⣿⣷⣰⣿⣿⠃⠀⢠⣿⣿⢃⣀⣤⣤⣾⣿⡟⠀⠀⠀⢻⣿⣆⠀⠀
⠀⠀⠀⣿⣿⡇⠀⠀⢀⣴⣿⣿⡟⠀⣿⣿⣿⣿⠃⠀⠀⣾⣿⣿⡿⠿⠛⢛⣿⡟⠀⠀⠀⠀⠀⠻⠿⠀⠀
⠀⠀⠀⠹⣿⣿⣶⣾⣿⣿⣿⠟⠁⠀⠸⢿⣿⠇⠀⠀⠀⠛⠛⠁⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠙⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

require 'bundler'
Bundler.require

require_relative 'lib/player'

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
name = gets.chomp
joueur = HumanPlayer.new(name)

puts "************************************************************"
puts "*                                                          *"
puts "*                 !  NEW CHALLENGER  !                     *"
puts "*                                                          *"
puts "*           ------{}::::::::::::::::::::>                  *"
puts "*                                                          *"
puts "*  Welcome #{joueur.name}! Prépare-toi à SAIGNER !         *"
puts "************************************************************"


enemies = []
enemies << Player.new("Shwarzeneeger")
enemies << Player.new("Stallone")

puts "***************************************************************************************"
puts "*                                                                                     *"
puts "*                                 F I G H T !                                         *"
puts "*                                                                                     *"
puts "*     ------{}::::::::::::::::::::>             ------{}::::::::::::::::::::>         *"
puts "*                                                                                     *"
puts "* #{joueur.name}, tu vas te battre contre Shwarzeneeger et Stallone ! Pas de bol !    *"
puts "*                                                                                     *"
puts "***************************************************************************************"

# Boucle de combat
def display_turn_info(player)
  puts "************************************************************"
  puts "*                                                          *"
  puts "*                    !  YOUR TURN   !                      *"
  puts "*                                                          *"
  puts "*           ------{}::::::::::::::::::::>                  *"
  puts "*                                                          *"
  puts "*           #{player.name} À L'ATTAQUE !                   *"
  puts "************************************************************"

  puts player.show_state

  puts "************************************************************"
  puts "*           QUELLE ACTION VEUX-TU EFFECTUER ?              *"
  puts "*                                                          *"
  puts "*         w - Chercher une meilleure arme                  *"
  puts "*         m - Prendre un Medipack                          *"
  puts "*         0 - Attaquer Schwarzy                            *"
  puts "*         1 - Attaquer Stallone                            *"
  puts "*                                                          *"
  puts "************************************************************"
  print "> "
end


def get_player_action
  gets.chomp
end

while joueur.en_vie? && enemies.any?(&:en_vie?)
    # Afficher les informations sur le tour du joueur
    display_turn_info(joueur)
    player_action = get_player_action
  
    # En fonction de l'action du joueur, effectuer les actions appropriées
    case player_action
    when "w"
      joueur.search_weapon
    when "m"
      joueur.search_medipack
    when "0"
      joueur.attacks(enemies[0]) if enemies[0].en_vie?
    when "1"
      joueur.attacks(enemies[1]) if enemies[1].en_vie?
    else
      puts "Mauvaise touche ! Tu passes ton tour !"
    end
  
    # Attaquer chaque ennemi vivant
    enemies.each do |enemy|
      enemy.attacks(joueur) if enemy.en_vie?
    end
  
    # Afficher l'état du joueur et des ennemis
    puts joueur.show_state
    enemies.each { |enemy| puts enemy.show_state if enemy.en_vie? }
  
    puts "                              ____"
    puts "                     __,-~~/~    `---."
    puts "                   _/_,---(      ,    )"
    puts "               __ /        <    /   )  \\___"
    puts "- ------===;;;'====------------------===;;;===----- -  -"
    puts "                  \\/  ~\"~\"~\"~\"~\"~\\~\"~)~\"/"
    puts "                  (_ (   \\  (     >    \\)"
    puts "                   \\_( _ <         >_>'"
    puts "                      ~ `-i' ::>|--\""
    puts "                          I;|.|.|"
    puts "                         <|i::|i|`."
    puts "                        (` ^'\"`-' \")"
    puts "************************************************************"
    puts "*                                                          *"
    puts "*                  B O O O O O O O M                       *"
    puts "*                                                          *"
    puts "*          STALLONE ET SCHWARZY T'ATTAQUENT !!             *"
    puts "*                                                          *"
    puts "*                                                          *"
    puts "************************************************************"
    

  gets.chomp  
end





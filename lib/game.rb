require_relative 'player'
require 'bundler'
Bundler.require 

class Game
    attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight
  
    def initialize(human_name)
      @human_player = HumanPlayer.new(human_name)
      @enemies = create_enemies(4) 
      @players_left = 10  
      @enemies_in_sight = []
    end
  
    def create_enemies(num)
      (1..num).map { |i| Player.new("Predator#{i}") }
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.en_vie? && @players_left > 1
    end
  
    def show_players
      puts "État du joueur humain :"
      @human_player.show_state
      puts "Nombre de Predators : #{@players_left - 1}"
    end
  
    def menu
      
    end
  
    def menu_choice(choice)
   
    end
  
    def enemies_attack
      @enemies_in_sight.each { |enemy| enemy.attacks(@human_player) if enemy.en_vie? }
    end
  
    def game_over_message
      if @human_player.en_vie?
        puts "Bravo ! Tu les a tous défoncés !."
      else
        puts "Tu t'es fait EXPLOSER!"
      end
    end
  
    def new_players_in_sight
      return puts "Predators en vue !" if @enemies_in_sight.size == @players_left
  
      dice_result = rand(1..6)
  
      case dice_result
      when 1
        puts "Pas de débarquement de Predator"
      when 2..4
        new_enemy = Player.new("Preadtor#{rand(15)}")
        @enemies_in_sight << new_enemy
        puts "Un nouveau Challenger#{new_enemy.name}, arrive en vue."
      when 5..6
        2.times do
          new_enemy = Player.new("Predator#{rand(15)}")
          @enemies_in_sight << new_enemy
          puts "Deux nouveaux Challengers #{new_enemy.name}, arrivent !"
        end
      end
    end
  end
  
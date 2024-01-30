require 'pry'


class Player
  attr_accessor :name, :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie !"
  end

  def gets_damage(damage)
    if @life_points
      @life_points -= damage
      puts "BAANG !! #{@name} a perdu #{damage} points de vie !"
      if @life_points <= 0
        puts "#{@name} s'est fait buter !"
      end
    else
      puts "#{@name} s'est fait buter !"
    end
  end

  def attacks(player)
    puts "#{@name} est en train de savater #{player.name} à gros coups de santiags !"

    damage = compute_damage
    player.gets_damage(damage)

    puts "#{@name} défonce #{damage} points de dommages à #{player.name} !"
  end

  def compute_damage
    rand(1..6)
  end

  def en_vie?
    @life_points > 0
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    found_weapon = rand(1..6)
    puts "Tu as trouvé un bazooka ! :"

    if found_weapon >= @weapon_level
      puts "Mais c'est une arme bien naze"
    elsif found_weapon < @weapon_level
      @weapon_level = found_weapon
      puts "Là ça va péter !"
    end
  end

  def search_medipack
    dice_result = rand(1..6)

    case dice_result
    when 1
      return "Tu vas devoir te soigner !"
    when 2..5
      heal_amount = [50, 100 - @life_points].min
      @life_points += heal_amount
      return "Okey, tu as trouvé Medipack +#{heal_amount} !"
    when 6
      heal_amount = [80, 100 - @life_points].min
      @life_points += heal_amount
      return "ALLRIGHT ! tu as trouvé Medipack +#{heal_amount} !"
    end
  end

  def en_vie?
    @life_points > 0
  end
end













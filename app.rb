require 'bundler'
Bundler.require 

require_relative 'lib/player'

player1 = Player.new("Shwarzeneeger")
player2 = Player.new('Stallone')

puts "Comparons les Colosses ! :"
player1.show_state
player2.show_state

puts "IL N'Y AURA QU'UN SEUL VAINQUEUR !    (ง •̀_•́)ง   :"


5.times do |round|
  puts "\n----- Round #{round + 1} -----"
  player1.attacks(player2)
  player2.attacks(player1)
end



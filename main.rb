require_relative 'view'
require_relative 'master'
require_relative 'ai'
def game
	m = MasterMind.new("huyanh")
	puts "The Code-Maker will choose 4 color-balls from 6 colors as the covered secret code."
  puts "The colors could be duplicated. And the guesser gets 12 tries to decode."
  puts "After each guess, the Code-Maker will give the answer upon how well the guess is."
  puts "Please choose [ 1 or 2 ] :"
  style = gets.chomp.to_i
  if style == 1
  	puts "Player is breaker"
    sleep 1
  	puts "Start generating ... code "
	  m.generateColor
	 	m.playerPlay
  elsif style == 2
  	puts "Player is maker and AI is breaker"
    sleep 1
  	a = Artificial.new
  	m.makeCodeManual
  	m.AIPlay(a)
  end
end
game
 
 
puts "Game Starting ...\n"

class Mastermind
  attr_accessor :correct, :half_correct,
  :wrong
  
  @@hidden_number = "12335"
  @@remaining_moves = 5
  
  def self.hidden_number
    @@hidden_number
  end
  
  def initialize
    self.correct = 0
    self.half_correct = 0
    self.wrong = 0
  end
  
  def analyze_input(user_input)
    hidden_characters = @@hidden_number.split('')
    given_characters = user_input.split('')
    new_array = Array.new

    hidden_characters.each_with_index do |char,index|
      if hidden_characters[index] == given_characters[index]
        new_array.push("Correct")   
        self.correct += 1
        hidden_characters[index] = given_characters[index] = "taken"
        
      elsif !(hidden_characters.include?(given_characters[index])) 
        self.wrong += 1
        new_array.push("Wrong")
        
      else  
        self.half_correct += 1
        new_array.push("Half correct")
      end
    end

    
    p new_array
    new_array
  end
end

is_playing = true
remaining_moves = 5

while is_playing
  player = Mastermind.new
  puts "\n  Remaining moves: #{remaining_moves}"
  puts "  Choose your five digits number"
  input = gets.chomp
  player.analyze_input(input)
  remaining_moves -= 1
  is_playing = false if (player.correct == Mastermind.hidden_number.length) || (remaining_moves <= 0)
end

terminating_message = remaining_moves <= 0 ? "\n  Sorry you ran out of moves 😔" : "\n  Congrats you've guessed the hidden number 🎉🎉🎉\n  The hidden number was #{Mastermind.hidden_number}"

puts terminating_message

puts "\nGame closing ...\n"
puts "Game Starting ...\n"

class Mastermind
  attr_accessor :correct, :half_correct,
  :wrong
  
  @@hidden_number = "12335"
  @@remaining_moves = 8
  @@is_playing = true
  
  def self.hidden_number
    @@hidden_number
  end
  
  def self.remaining_moves
    @@remaining_moves
  end
  
  def initialize
    self.correct = 0
    self.half_correct = 0
    self.wrong = 0
    @@is_playing = @@hidden_number.length == correct
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
  end
end

player = Mastermind.new

puts "Game closing ...\n"
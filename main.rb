puts ""

class Mastermind
  attr_accessor :correct, :half_correct,
  :wrong
  
  @@hidden_number = "123456"
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
    @@is_playing = @@hidden_number.length == @correct
  end
  
  def analyze_input(user_input)
    hidden_characters = @@hidden_number.split('')
    given_characters = user_input.split('')
    new_array = Array.new

    p hidden_characters
    p given_characters

    puts "-------------------------------"
    hidden_characters.each_with_index do |char,index|
      if hidden_characters[index] == given_characters[index]
        hidden_characters[index] = nil
        new_array.push("Correct")
        
      elsif !(hidden_characters.include?(char))
        hidden_characters[index] = nil
        new_array.push("Wrong")
        
      else  
        hidden_characters[index] = nil
        new_array.push("Half correct")
      end
      given_characters[index] = nil
      p hidden_characters
    end

    puts "-------------------------------"

    puts ""
    puts "given characters"
    p given_characters

    puts ""
    puts "hidden characters"
    p hidden_characters

    puts ""
    puts "new array"
    p new_array

  end
end

player = Mastermind.new
player.analyze_input("111111")

puts ""
require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class BattleshipRunner

  def initialize
  end

  def main_menu
    loop do
      puts "Welcome to BATTLESHIP"
      puts "Enter p to play. Enter q to quit."
        input = gets.chomp.upcase
          if input  == "Q"
            return
          else input == "P"
            setup
          end
        end
  end

  def setup
    player_setup
    computer_setup
  end

  def player_setup
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)
    player_board = Board.new
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is two units long and the Submarine is three units long."
    puts "  1 2 3 4 \nA  . . . . \nB  . . . . \nC  . . . . \nD  . . . . \n"

    loop do
    puts "Enter the three squares for the Cruiser separated by spaces (e.g. A1 A2 A3)"
    player_cruiser_coordinates = gets.chomp.split
      if player_board.valid_placement?(player_cruiser, player_cruiser_coordinates)
        player_board.place(player_cruiser, player_cruiser_coordinates)
        break
      else
        puts "Those coordinates are invalid"
      end
    end
    puts player_board.render(true)
    loop do
    puts "Enter the two squares for the Submarine separated by spaces (e.g. A1 A2)"
    player_submarine_coordinates = gets.chomp.split
      if player_board.valid_placement?(player_submarine, player_submarine_coordinates)
        player_board.place(player_submarine, player_submarine_coordinates)
        break
      else
        puts "Those coordinates are invalid"
      end
    end
    puts player_board.render(true)
  end

  def computer_setup
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)
    computer_board = Board.new
    valid_cruiser_placement = [['A1', 'A2', 'A3'], ['A2', 'A3', 'A4'], ['B1', 'B2', 'B3'], ['B2', 'B3', 'B4'], ['C1', 'C2', 'C3'], ['C2', 'C3', 'C4'], ['D1', 'D2', 'D3'], ['D2', 'D3', 'D4'], ['A1', 'B1', 'C1'], ['C1', 'B1', 'D1'], ['A2', 'B2', 'C2'], ['B2', 'C2', 'D2'], ['A3', 'B3', 'C3'], ['B3', 'C3', 'D3'], ['A4', 'B4', 'C4'], ['B4', 'C4', 'D4']]
    computer_board.place(computer_cruiser, valid_cruiser_placement.sample)
    puts computer_board.render(true)
  end


end

runner = BattleshipRunner.new
runner.computer_setup
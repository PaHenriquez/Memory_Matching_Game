require_relative "Card"
require_relative "Board"

class Game
    attr_accessor :previous_guess
    attr_reader :Board

    def initialize
        @board = Board.new
        @previous_guess = nil
    end

    def make_guess(row,column)
        @board.display_grid[row][column] = @board[row,column].reveal

        if @previous_guess.eql? nil
            @board.render
            @previous_guess = [row,column]
        else
            if @previous_guess == [row,column]
                @board.render
                @board.display_grid[row][column] = " "

            elsif @board[@previous_guess[0],@previous_guess[1]] != @board[row,column]
                @board.render
                puts "try again"
                sleep(1)
                @board.display_grid[row][column] = " "
                @board.display_grid[@previous_guess[0]][@previous_guess[1]] = " "

            else
                @board.render
                puts "Its a match"
                
            end
            @previous_guess = nil
        end
    end

    def play
        until @board.won? do
            @board.render
            puts "enter position Ex: 2,3"
            guess_pos = gets.chomp
            make_guess(guess_pos[0].to_i,guess_pos[2].to_i)
        end
        puts "you win"
    end
end

game = Game.new
game.play

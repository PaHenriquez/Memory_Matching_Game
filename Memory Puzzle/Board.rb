require_relative "Card"

class Board

    attr_accessor :display_grid

    def initialize(size = 4)
        @size = size
        @grid = Array.new(size){Array.new(size)}
        @display_grid = Array.new(size){Array.new(size," ")}
        populate
    end

    def [](row,column)
        @grid[row][column]
    end

    def []=(row,column,value)
        @grid[row][column] = value
    end

    def populate
        alpha = ("A".."Z").to_a.join("")
        i = 0
        while i < (@size*@size)
            row,column = rand(0...@grid.length),rand(0...@grid.length)
            if self[row,column].eql? nil
                self[row,column] = Card.new(alpha[i/2])
                i+=1
            end
        end
    end

    def render
        system("clear")
        puts "_ " + (0...@display_grid.length).to_a.join(" ")
        (0...@display_grid.length).each do |num|
            puts "#{num} " + "#{@display_grid[num].join(" ")}"
        end
    end

    def won?
        @display_grid.flatten.all?{|ele| ele != " "}
    end

end
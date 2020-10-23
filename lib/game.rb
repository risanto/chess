require_relative "pieces/knight.rb"

class Game
    attr_accessor :board

    def initialize
        @board = [
          ['black-rook-1', 'black-knight-1', 'black-bishop-1', 'black-king', 'black-queen', 'black-bishop-2', 'black-knight-2', 'black-rook-2'],
          ['black-pawn-1', 'black-pawn-2', 'black-pawn-3', 'black-pawn-4', 'black-pawn-5', 'black-pawn-6', 'black-pawn-7', 'black-pawn-8'],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
          ['white-pawn-1', 'white-pawn-2', 'white-pawn-3', 'white-pawn-4', 'white-pawn-5', 'white-pawn-6', 'white-pawn-7', 'white-pawn-8'],
          ['white-rook-1', 'white-knight-1', 'white-bishop-1', 'white-king', 'white-queen', 'white-bishop-2', 'white-knight-2', 'white-rook-2']
        ]
    end

    def change_symbol(el)
        if el.include? 'white-king'
            '♔'
        elsif el.include? 'white-queen'
            '♕'
        elsif el.include? 'white-rook'
            '♖'
        elsif el.include? 'white-bishop'
            '♗'
        elsif el.include? 'white-knight'
            '♘'
        elsif el.include? 'white-pawn'
            '♙'

        elsif el.include? 'black-king'
            '♚'
        elsif el.include? 'black-queen'
            '♛'
        elsif el.include? 'black-rook'
            '♜'
        elsif el.include? 'black-bishop'
            '♝'
        elsif el.include? 'black-knight'
            '♞'
        elsif el.include? 'black-pawn'
            '♟︎'
        else
            ' '
        end
    end

    def display
        puts ""
        
        @board.each_with_index do |row, row_idx|
            line = "#{row_idx+1}| "

            row.each_with_index do |el, el_idx|
                if el == ' '
                    if row_idx % 2 == 0
                        el_idx % 2 == 0 ? line += '░ ' : line += '█ '
                    elsif row_idx % 2 == 1
                        el_idx % 2 == 1 ? line += '░ ' : line += '█ '
                    end
                else
                    line += '' +change_symbol(el) + ' '
                end
            end

            puts line
        end

        puts '  ================'
        puts '   a b c d e f g h'
        puts ""
    end

    def change_to_idx(pos)
        ltr_to_idx = -1

        case pos[0]
        when 'a'
            ltr_to_idx = 0
        when 'b'
            ltr_to_idx = 1
        when 'c'
            ltr_to_idx = 2
        when 'd'
            ltr_to_idx = 3
        when 'e'
            ltr_to_idx = 4
        when 'f'
            ltr_to_idx = 5
        when 'g'
            ltr_to_idx = 6
        when 'h'
            ltr_to_idx = 7
        end

        [(pos[1].to_i - 1), ltr_to_idx]
    end

    def find_piece(piece_name)
        for row in 0..@board.length do
            for col in 0..@board[row].length do
                return [row, col] if @board[row][col] == piece_name
            end
        end

        return nil
    end

    def valid_move?(initial, destination)
        y_init, x_init = change_to_idx(initial)
        y_dest, x_dest = change_to_idx(destination)

        colour = nil

        if @board[y_init][x_init].include? ('white')
            colour = 'white'
        elsif @board[y_init][x_init].include? ('black')
            colour = 'black'
        end

        if colour == 'white' && @board[y_init][x_init].include?('white')
            return false
        elsif colour == 'black' && @board[y_init][x_init].include?('black')
            return false
        end
    end

    def play
        system("clear") || system("cls")

        display

        puts "Pick a move by choosing an initial position and its destination (ex: b8 c6)"

        picked_move = gets.chomp.split

        valid_move(picked_move[0], picked_move[1])
    end
end

game = Game.new
# game.play
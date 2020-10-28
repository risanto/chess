require_relative "pieces/knight.rb"
require 'pry'

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
        @playing = true
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

    # accepts piece_name and returns symbol
    def change_symbol(piece_name)
        if piece_name.include? 'white-king'
            '♔'
        elsif piece_name.include? 'white-queen'
            '♕'
        elsif piece_name.include? 'white-rook'
            '♖'
        elsif piece_name.include? 'white-bishop'
            '♗'
        elsif piece_name.include? 'white-knight'
            '♘'
        elsif piece_name.include? 'white-pawn'
            '♙'

        elsif piece_name.include? 'black-king'
            '♚'
        elsif piece_name.include? 'black-queen'
            '♛'
        elsif piece_name.include? 'black-rook'
            '♜'
        elsif piece_name.include? 'black-bishop'
            '♝'
        elsif piece_name.include? 'black-knight'
            '♞'
        elsif piece_name.include? 'black-pawn'
            '♟︎'
        else
            ' '
        end
    end

    # accepts ltr & idx and returns array of inner & outer indexes (ex: [6, 0])
    def change_to_idx(ltr, idx)
        ltr_to_idx = -1

        case ltr
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

        [idx.to_i - 1, ltr_to_idx]
    end

    # accepts piece_name and returns its position -> [row, col]
    def find_piece(piece_name)

        for row in 0..@board.length do
            for col in 0..@board[row].length do
                return [row, col] if @board[row][col] == piece_name
            end
        end

        return nil
    end

    # accepts y & x (outer and inner index) and returns the name of the piece on that position
    def get_piece_name_by_pos(y, x)
        @board[y][x]
    end

    
    # accepts initial (ex: [6, 0]) & destination (ex: [4, 0]) and returns true/false based on the validity of the move
    def valid_move?(initial, destination)

        y_init, x_init = initial
        y_dest, x_dest = destination
        
        return false if y_init > 7 || y_init < 0 || x_init > 7 || x_init < 0 || y_dest > 7 || y_dest < 0 || x_dest > 7 || x_dest < 0

        return false if @board[y_init][x_init] == ' '

        colour = nil

        if @board[y_init][x_init].include? ('white')
            colour = 'white'
        elsif @board[y_init][x_init].include? ('black')
            colour = 'black'
        end
        
        if colour == 'white' && @board[y_dest][x_dest].include?('white')
            return false
        elsif colour == 'black' && @board[y_dest][x_dest].include?('black')
            return false
        end

        true
    end

    
    # accepts initial (ex: [6, 0]) & destination (ex: [4, 0]) and move the initial piece to its destination
    def move(initial, destination) 

        y_init, x_init = initial
        y_dest, x_dest = destination

        @board[y_dest][x_dest] = get_piece_name_by_pos(y_init, x_init)
        @board[y_init][x_init] = " "
    end

    def play
        while @playing do
            # system("clear") || system("cls")
    
            display

            input_complete = false

            while !input_complete do
                puts "Pick a move by choosing an initial position and its destination (ex: b8 c6)"
                
                picked_move = gets.chomp.split
                
                input_complete = true if picked_move[0] && picked_move[1]
            end
            
            ltr_init, idx_init = picked_move[0].split('')
            ltr_dest, idx_dest = picked_move[1].split('')

            initial = change_to_idx(ltr_init, idx_init)
            destination = change_to_idx(ltr_dest, idx_dest)
    
            move(initial, destination) if valid_move?(initial, destination)
        end
    end
end

game = Game.new

game.play
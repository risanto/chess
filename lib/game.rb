class Game
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
end

game = Game.new
game.display
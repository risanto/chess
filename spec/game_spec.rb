require '../lib/game.rb'

describe Game do
    let(:game) { Game.new }
    let(:board) { game.board }

    describe "#valid_move?" do
        it "returns false when the destination is occupied by a piece with the same colour as the current moving piece" do
            y_wp1, x_wp1 = game.find_piece('white-pawn-1')
            board[5][0] = 'white-pawn-1'
            board[y_wp1][x_wp1] = ' '

            expect(game.valid_move?('a8', 'a6')).to be(false)
        end

        it "returns false when there's no piece in the initial position" do
            expect(game.valid_move?('a6', 'a6')).to be(false)
            expect(game.valid_move?('c5', 'a6')).to be(false)
            expect(game.valid_move?('d4', 'a6')).to be(false)
        end

        it "returns false when the coordinate doesn't exist" do
            expect(game.valid_move?('a9', 'a6')).to be(false)
        end

        it "returns true when it's a valid move for knight" do
            
        end
    end
end
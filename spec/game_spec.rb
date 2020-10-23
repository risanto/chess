require '../lib/game.rb'

describe Game do
    let(:game) { Game.new }
    let(:board) { game.board }

    describe "#valid_move?" do
        it "returns false when the destination is occupied by a piece with the same colour" do
            y_wp1, x_wp1 = game.find_piece('white-pawn-1')
            board[5][0] = 'white-pawn-1'
            board[y_wp1][x_wp1] = ' '

            y_wr1, x_wr1 = game.find_piece('white-rook-1')

            expect(game.valid_move?('a8', 'a6')).to be(false)
        end
    end
end
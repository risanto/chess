require '../lib/game.rb'

describe Game do
    let(:game) { Game.new }
    let(:board) { game.board }

    describe "#valid_move?" do
        it "returns false when the destination is occupied by a piece with the same colour" do
            pp board
        end
    end
end
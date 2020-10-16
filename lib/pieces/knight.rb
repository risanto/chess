class Knight
    attr_accessor :position, :pos_moves, :parent

    def initialize(pos, parent = nil)
        @position = generate_position(pos)
        @pos_moves = generate_pos_moves(pos)
        @parent = parent
    end

    def generate_position(pos)
        position = nil
        y_position, x_position = pos

        if y_position >= 0 && y_position <= 7 && x_position >= 0 && y_position <= 7
            position = [y_position, x_position]
        end

        position
    end

    def generate_pos_moves(pos)
        y_position, x_position = pos

        pos_moves = [
            generate_position([y_position - 2, x_position + 1]),
            generate_position([y_position - 2, x_position - 1]),
            generate_position([y_position - 1, x_position + 2]),
            generate_position([y_position - 1, x_position - 2]),
            generate_position([y_position + 2, x_position - 1]),
            generate_position([y_position + 2, x_position + 1]),
            generate_position([y_position + 1, x_position - 2]),
            generate_position([y_position + 1, x_position + 2])
        ].select {|pos| pos != nil}
    end
end
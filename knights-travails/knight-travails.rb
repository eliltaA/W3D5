require_relative "tree_node.rb"

class KnightPathFinder

    attr_reader :root_node

    def self.valid_moves(pos)
        rank, file = pos
        squares = *(1..8)
    
        all_moves = []
        all_moves << [rank-2,file+1]
        all_moves << [rank-1,file+2]
        all_moves << [rank+1,file+2]
        all_moves << [rank+2,file+1]
        all_moves << [rank+2,file-1]
        all_moves << [rank+1,file-2]
        all_moves << [rank-1,file-2]
        all_moves << [rank-2,file-1]

        valid_moves = all_moves.select do |pos|
            row, col = pos
            squares.include?(row) && squares.include?(col)
        end

        return valid_moves

    end













    def initialize(pos)
        # @current_position = pos
        @board = Array.new(8) {Array.new(8, [])}
        @root_node = PolyTreeNode([pos])
        # @move_tree = 
    end

    # def build_move_tree
    #     self.root_node
    #     ()

    # end

end
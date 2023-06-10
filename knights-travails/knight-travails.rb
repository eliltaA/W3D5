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
        @start_position = pos
        @board = Array.new(8) {Array.new(8, [])}
        @root_node = PolyTreeNode([pos])
        @considered_positions = [pos]
        # @move_tree = 
    end

    def new_move_positions(pos)
    options = KnightPathFinder.valid_moves(pos).select {|pos| !@considered_positions.include?(pos)}
    @considered_positions += options
    return options
    end
    
    def build_move_tree
        q = Queue.new
        q.enq(@root_node)
        until q.empty?
            current_node = q.deq
            current_pose = current_node.value
            return current_node if current_node.value == target_value
            current_node.chidren = new_move_positions(current_pose)
            current_node.children.each do |child|
            q.enq(child)
            end
        end
        nil
      end
    end

    
end
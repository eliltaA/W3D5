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
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos] 
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
            curr_node = q.deq
            curr_pos = curr_node.value
            
            # puts
            # # ===================================="
            # puts
            # puts "current position is: #{curr_pos}"
            # puts "current node is: #{curr_node}"
            # arr = new_move_positions(curr_pos)
            # puts "the current possible move array is: #{arr}"
            # # puts "current node is: #{curr_node}"
            # puts
            # puts "END TEST ===================================="
            # puts

            new_move_positions(curr_pos).each do |move|
                curr_node.children << PolyTreeNode.new(move)
            end
            curr_node.children.each do |child|
                q.enq(child)
            end
        end
        nil
    end

    
end


# start_pos = [1,1]
# gg = KnightPathFinder.new(start_pos)
# system("clear")
# puts "=================== TESTING BEGINS ==================="

# puts
# puts "Starting position is #{start_pos}"
# a,b = gg.new_move_positions(start_pos)
# print [a,b]                             ## => [[2,3], [3,2]]
# puts

# puts
# puts "Starting position is #{a}"
# print gg.new_move_positions(a)          ## => [[3,1], [4,2], [4,4], [3,5], [1,5]]
# puts

# puts
# puts "Starting position is #{b}"
# print gg.new_move_positions(b)          ## => [[5,1], [5,3], [4,4], [2,4], [1,3]]
# puts

# start_pos = [1,1]
# gg = KnightPathFinder.new(start_pos)

# puts
# puts "================= Build Node Tree Test ==============="
# gg.build_move_tree
# puts "Root node:"
# p gg.root_node
# puts "gg.root_node"
# puts
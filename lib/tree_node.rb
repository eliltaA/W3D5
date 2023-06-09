class PolyTreeNode
    attr_reader :parent, :children, :value
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    if self.parent 
        self.parent.children.delete(self)
    end
    @parent = new_parent
    new_parent.children << self if new_parent && !new_parent.children.include?(self)
   
  end

end

#node2.parent = node1
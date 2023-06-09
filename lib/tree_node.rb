class PolyTreeNode
    attr_reader :parent, :children, :value
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    p self
    p self.parent.children
    if self.parent != nil
        p self
        p self.parent.children
        self.parent.children.delete(self)
    end
    #self.parent = new_parent
    new_parent.children << self if new_parent && !new_parent.children.include?(self)
   
  end

end

#node2.parent = node1
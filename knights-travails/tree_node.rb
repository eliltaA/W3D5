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

  def add_child(child) # child = node3 ,,, self = node2

    child.parent = self   #CHNAGE node3's parent to node2

    @children << child  if !self.children.include?(child) # add node3 into node2's children list
    
  end

  def remove_child(child)
    parent = self
    if !parent.children.include?(child)
      raise
    end
      if parent 
      parent.children.delete(child)  #
      child.parent = nil 
    end
  end


  def dfs(target_value)
    return self if self.value == target_value   # if node 1 happend to be the target
      self.children.each do |child|
        found = child.dfs(target_value)  #so that we dont call it again
        return found if found
      end
      return nil
  end

  def bfs(target_value)
   # return self if self.value == target_value   # if node 1 happend to be the target
    #chidren = self.children
    q = Queue.new
    q.enq(self)
    until q.empty?
        current = q.deq
        return current if current.value == target_value
        current.children.each do |child|
        q.enq(child)
        end
    end
    nil
  end

end

class Tree
  def initialize(root = nil)
    @root = root
  end

  def breadth_first_traversal(node)
    result = []
    nodes_to_visit = [node]

    while nodes_to_visit.length > 0
      node = nodes_to_visit.shift
      result.push(node[:value])
      nodes_to_visit = nodes_to_visit + node[:children]
    end
    result
  end

  def depth_first_traversal(node, result= [])
    result.push(node[:value])

    node[:children].each do |child|
      depth_first_traversal(child, result)
    end
    result
  end

  def get_element_by_id(string)
    traverse(string)
  end

  private

  def traverse id, method='depth'
    node_list = [@root]

    while !node_list.empty?
      if :method == 'depth'
        current_node = node_list.pop
      else
        current_node = node_list.shift
      end
      return current_node if current_node[:id] == id

      node_list = node_list + current_node[:children]
    end
    nil
  end
end
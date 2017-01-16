defmodule  do

def run do
  alias ChapterOne.BTree
  data = [0,1,2,3,4,5,6]
  node = BTree.build(data,0,6)
# BTree.traverse_inorder(node)


alias ChapterOne.BTree
data1 = [0,1,2,3,4,5]
first = BTree.build(data1,0,5)

data2 = [6,7,8,9,10,11,12,13]
second = BTree.build(data2,0,7)

first_min = BTree.min(first)
second_min = BTree.max(second)
new_root_data = (first.data + second.data)/2
new_root = TreeNode.new(new_root_data)
new_root = %{new_root | left: first, right: second }
BTree.delete_node(new_root, new_root)




BTree.max(node)
end

end

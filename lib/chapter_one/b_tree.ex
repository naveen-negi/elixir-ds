defmodule ChapterOne.BTree do
alias ChapterOne.TreeNode

  def initialize([start | next]) do
    head = TreeNode.new(start)
    loop(head, next)
  end

def loop(root, [head | tail]) do
      node = TreeNode.new(head)
      root = build(root, node)
      loop(root, tail)
end

def loop(root, []) do
    root
end

def build(list, start, size) when start > size do
  nil
end

def build(list, start, size) do
          mid = round((start  + size)/2)

          parrent = TreeNode.new(get_node_at(list, mid))

         left = build(list, start, mid - 1)

         parrent_with_left_child = %{parrent | left: left}

           right = build(list, mid + 1, size)

          %{parrent_with_left_child | right: right}
end

  def get_node_at(data,index) do
     Enum.at(data, round(index))
  end

  def build(head,node) do

    case node.data <= head.data do
      true ->  cond do
                head.left == nil ->  %{head | left: node}
                head.left != nil -> new_node = build(head.left, node)
                                   %{head | left: new_node}
               end
      false -> cond do
                head.right == nil ->  %{head | right: node}
                head.right != nil ->  new_node = build(head.right, node)
                             %{head | right: new_node}
               end
    end
  end

  def min(root) do
    if root.left != nil do
      min(root.left)
    else
      root
    end


  end

  def max(root) do
    if root.right != nil do
      max(root.right)
    else
      root
    end
  end

  def insert(root, new_node) when is_nil(root) do
      TreeNode.new(new_node)
  end

  def insert(root, new_node) do
      cond do
        new_node < root.data -> new_node = insert(root.left, new_node)
                                  %{root | left: new_node}
                        true -> new_node = insert(root.right, new_node)
                                %{root | right: new_node}
      end
  end


  def traverse_inorder(root) when is_nil(root), do: root

  def traverse_inorder(root) do
    traverse_inorder(root.left)
    IO.puts root.data
    traverse_inorder(root.right)
    end

def traverse_inorder_reverse_(root) when is_nil(root), do: root

def traverse_inorder_reverse_(root) do
  traverse_inorder_reverse_(root.right)
  IO.puts root.data
  traverse_inorder_reverse_(root.left)
end

  def find_successor(root, key) do
        key_node = find_node(root, key)

      successor =   cond do
                      key_node.right != nil -> min(key_node.right)
                        true -> inorder_successor(root, key, nil)
                    end

        successor.data
  end

  def inorder_successor(root, key, successor) when is_nil(root) do
      successor
  end

  def inorder_successor(root, key, successor) do
        cond do
          key < root.data  ->
            sucessor = inorder_successor(root.left, key, root)
          key >= root.data ->
            inorder_successor(root.right, key, successor)
        end
  end

    def successor(root) do
      if root.left == nil do
        root
      else
        successor(root.left)
      end
    end

    def find_node(root, key) do
     cond do
        key < root.data ->  find_node(root.left, key)
        key > root.data ->  find_node(root.right, key)
        key == root.data -> root
     end
    end

 def delete_node(root, key) do
     node = TreeNode.new(key)
     delete(root,node)
 end
  def delete(root, node) do
       cond do
         node.data < root.data -> node = delete(root.left, node)
                                  %{root | left: node}
         node.data > root.data -> node = delete(root.right, node)
                                  %{root | right: node}
         node.data == root.data ->
           cond do
             root.left == nil && root.right == nil -> nil
             root.left != nil && root.right == nil -> root.left
             root.left == nil && root.right != nil -> root.right
             root.left != nil && root.right != nil -> new_node = min(root.right)
                                                      new_right  = delete(root.right, new_node)
                                                      %{new_node | left: root.left, right: new_right}
           end
       end
  end

  def merge_tree(first, second) do
    first_min = min(first)
    second_min = max(second)
    new_root_data = (first.data + second.data)/2
    new_root = TreeNode.new(new_root_data)
    new_root = %{new_root | left: first, right: second }
    delete(new_root, new_root)
  end

def height(root) when is_nil(root)  do
  0
end

  def height(root) do
      left_height = height(root.left)
      right_height = height(root.right)

      cond do
        left_height > right_height -> left_height + 1
        true -> right_height + 1
      end
  end

  def print_all_levels(root) do
       height = height(root)
       get_all_node_at_level(root, height, height)
  end

def get_all_node_at_level(root, height, level) when level <= 0  do
    nil
end

def get_all_node_at_level(root, height, level) do
  new_level = level-1
    get_all_node_at_level(root, height, new_level)
    get_node_at_level(root, height, level)
end

  def get_node_at_level(root, height, level) when is_nil(root)  do
      nil
  end

def get_node_at_level(root, height, level) when height==level do
  IO.puts root.data
end


  def get_node_at_level(root, height,tree_level) do
    new_height = height - 1
       get_node_at_level(root.left, new_height, tree_level)
       get_node_at_level(root.right, new_height, tree_level)
  end

end

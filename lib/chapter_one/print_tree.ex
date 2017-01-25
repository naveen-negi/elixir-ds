defmodule ChapterOne.PrintTree do

  def print_all_levels(root, rep \\ nil) do
       height = height(root)
       if is_nil(rep) do
         get_all_node_at_level(root, height, height, nil)
       else
         get_all_node_at_level(root, height, height, rep)
       end
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


def get_all_node_at_level(root, height, level,rep) when level <= 0  do
    nil
end

def get_all_node_at_level(root, height, level,rep) do
  new_level = level-1
    get_all_node_at_level(root, height, new_level,rep)
    get_node_at_level(root, height, level,rep)
end

  def get_node_at_level(root, height, level, rep) when is_nil(root)  do
      nil
  end

def get_node_at_level(root, height, level,rep) when height==level do
    if rep == nil do
      IO.puts root.data
    else
      rep.(root)
    end
end


  def get_node_at_level(root, height,tree_level,rep) do
    new_height = height - 1
       get_node_at_level(root.left, new_height, tree_level, rep)
       get_node_at_level(root.right, new_height, tree_level, rep)
  end

end

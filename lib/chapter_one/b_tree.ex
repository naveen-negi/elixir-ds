defmodule ChapterOne.BTree do
alias ChapterOne.TreeNode

  def initialize([start | next]) do
#do something over here and
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


def build(list, start, size) do

cond do
  start > size -> nil
  start <= size     ->

          mid = round((start  + size)/2)
          IO.puts "start, size and mid is ..."
          IO.puts start
          IO.puts size
          IO.puts mid

          parrent = TreeNode.new(get_node_at(list, mid))
          IO.puts "parrent is ..."
          IO.inspect(parrent)
          IO.puts "....................."

         left = build(list, start, mid - 1)

         parrent_with_left_child = %{parrent | left: left}

           right = build(list, mid + 1, size)

          parrent_with_right_child =  %{parrent_with_left_child | right: right}

              IO.puts "This time call returned ... "
            IO.inspect(parrent_with_right_child)
end
end

  def get_node_at(data,index) do
    IO.puts "mid is "
    IO.puts index
    value = Enum.at(data, round(index))
    IO.puts(value)
    value
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
end

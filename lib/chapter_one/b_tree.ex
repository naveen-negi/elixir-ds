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

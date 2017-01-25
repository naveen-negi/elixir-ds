

defmodule ChapterOne.SegTree do
alias ChapterOne.SegNode
alias ChapterOne.RangeNode
import ChapterOne.NodeOperations

  def construct(:sum, list, size) do
    build(list,0,size, &sum/2)
  end

  def construct(:min, list, size) do
    build(list,0,size, &min_of/2)
  end

def build(list, first, last) when first > last do
  nil
end

def build(list, first, last, func) when first == last do
      value = Enum.at(list, round(first))
      %RangeNode{data: value, first: first, last: last}
end

  def build(list, first, last, func) do
         mid = Float.floor((first + last)/2)
         parrent_node = %RangeNode{first: first, last: last}

          left = build(list, first, mid, func)
          parrent_node = %{ parrent_node | left: left}

          right = build(list, mid + 1, last, func)
          parrent_node = %{parrent_node | right: right}

         %{parrent_node | data: func.(left, right)}
  end

  def update_node_at(root, index, value) do

     mid = Float.floor((root.first + root.last)/2)

     cond do
       index == root.first && index == root.last ->  %{root | data: value}
       is_leaf_node(root) -> root
       true ->   left = update_node_at(root.left, index, value)
                 IO.puts "left is : " <> to_string(left.data)
                right = update_node_at(root.right, index, value)
                min_value = min_of(left,right)
                IO.puts "right is : " <> to_string(right.data)
                %{root | data: min_value, right: right, left: left}
     end
  end

  def partial_sum(root, number) do

  end

  def is_leaf_node(node) do
    is_nil(node.left) && is_nil(node.right)
  end
end

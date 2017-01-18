defmodule ChapterOne.SegTree do
alias ChapterOne.SegNode
alias ChapterOne.TreeNode

  def construct(:sum, list, size) do
    build(list,0,size, &sum/2)
  end

  def construct(:min, list, size) do
    build(list,0,size, &min_of/2)
  end

def build(list, first, last) when first > last do
  nil
end

def min_of(left, right) when is_nil(left) and is_nil(right) do
  nil
end

def min_of(left, right) when is_nil(left) and right != nil do
  right.data
end

def min_of(left, right) when is_nil(right) and left != nil do
  left.data
end

def min_of(left, right) do
  cond do
    left < right -> left.data
    left >= right -> right.data
   end
end

def sum(left, right) when is_nil(left) and is_nil(right) do
  nil
end

def sum(left, right) when is_nil(left) and right != nil do
  right.data
end

def sum(left, right) when is_nil(right) and left != nil do
  left.data
end

def sum(left, right) do
  left.data + right.data
end

def build(list, first, last, func) when first == last do
      value = Enum.at(list, round(first))
      TreeNode.new(value)
end
def build(list, first, last, func) when first > last do
      nil
end


  def build(list, first, last, func) do
         mid = Float.floor((first + last)/2)
         parrent_node = TreeNode.new()

          left = build(list, first, mid, func)
          parrent_node = %{ parrent_node | left: left}

          right = build(list, mid + 1, last, func)
          parrent_node = %{parrent_node | right: right}

         %{parrent_node | data: func.(left, right)}
  end
end

defmodule ChapterOne.PartialSum do
alias ChapterOne.PSNode
alias  ChapterOne.PrintTree

  def construct(list) do
     build(list, 0, length(list) - 1)
  end

  def build(list, first, last) when first > last do
    nil
  end

  def build(list, first, last) when first == last do
    %PSNode{data: Enum.at(list, round(first)), left: nil, right: nil, size: 1}
  end

  def build(list, first, last) do
      mid = Float.floor((first  + last)/2)
      left = build(list, first, mid)
      right = build(list, mid + 1, last)
      %PSNode{data: left.data + right.data, left: left, right: right, size: left.size + right.size}
  end

  def sum(root, index) when is_nil(root)  do
    0
  end

  def sum(%PSNode{data: data, left: left, right: right, size: size} = root, index) do
    rep(root)
     cond do
                    index == root.size -> root.data
                index == root.left.size -> IO.puts("is equal")
                                          rep(root.left)
                                          root.left.data

            index < root.left.size -> IO.puts "Going left"
                                     sum(root.left, index)

            index > root.left.size -> IO.puts "Going right"
                                  root.left.data + sum(root.right, index - root.left.size )
      end
  end

def print(root) do
  PrintTree.print_all_levels(root, &rep/1)
end

def rep(node) do
  if is_nil(node) do
     IO.puts "nil node"
   else
     IO.puts "data: #{node.data} size: #{node.size}"
  end
end

end

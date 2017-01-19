defmodule ChapterOne.SegTree do
alias ChapterOne.SegNode
alias ChapterOne.RangeNode

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
      %RangeNode{data: value, first: first, last: last}
end
# def build(list, first, last, func) when first > last do
#       nil
# end


  def build(list, first, last, func) do
         mid = Float.floor((first + last)/2)
         parrent_node = %RangeNode{first: first, last: last}

          left = build(list, first, mid, func)
          parrent_node = %{ parrent_node | left: left}

          right = build(list, mid + 1, last, func)
          parrent_node = %{parrent_node | right: right}

         %{parrent_node | data: func.(left, right)}
  end



    def is_within_range(data, root_first, root_last, range_start, range_last) when range_start <= root_first and range_last >= root_last do
      IO.puts "inside range"
       {:within, data}
    end

    def is_within_range(data, root_first, root_last, range_start, range_last) when root_last < range_start do
        IO.puts "root_last < range_start" <> "#{to_string(root_last)}" <> "<"  <> "#{to_string(range_start)}"
      {:outside_left, 1000}
    end

    def is_within_range(data, root_first, root_last, range_start, range_last) when root_first > range_last do
      IO.puts "root_first > range_last" <> "#{root_first}" <> ">"  <> "#{range_last}"
      {:outside_right, 1000}
    end

    def is_within_range(data, root_first, root_last, range_start, range_last) do
      IO.puts "root_first > range_last" <> "#{root_first}" <> ">"  <> "#{range_last}"
      {:default, nil }
    end

    def rmq(root,range_start,range_last) when is_nil(root) do
      1000
    end

  def rmq(root,range_start,range_last) do
         #0, 0, 6, 3, 5
          case is_within_range(root.data, root.first, root.last, range_start, range_last)  do
            {:outside_left, value} -> value
            {:outside_right, value} -> value
            {:within, value} -> value
            {:default, value} ->   min_left  = rmq(root.left, range_start, range_last)
                                  min_right = rmq(root.right, range_start, range_last)
                                  cond do
                                    min_left <= min_right -> min_left
                                    min_left > min_right -> min_right
                                  end
          end


  end
end

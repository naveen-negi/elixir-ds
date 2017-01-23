# Problem statement: Suppose that we are given a sequence of n values x1, x2, ..., xn and seek to
# quickly answer repeated queries of the form: given i and j, find the smallest value
# in xi, . . . , xj .
# (b) Design a data structure that uses O(n) space and answers queries in O(log n)
# time. For partial credit, your data structure can use O(n log n) space and have
# O(log n) query time.

defmodule ChapterOne.RMQ  do

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

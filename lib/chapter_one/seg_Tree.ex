

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


end

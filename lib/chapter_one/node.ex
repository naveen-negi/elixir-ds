defmodule ChapterOne.Node do

  def new do
    %{data: nil, next: nil}
  end

  def new(data) do
    %{data: data, next: nil}
  end

  def append_node(%{data: head_data, next: head_next}  = head,  %{data: tail_data, next: tail_next}  = node) do
      case head.next do
        nil -> %{head | next: node}
        _   -> new_head = append_node(head.next, node)
                %{head | next: new_head }
      end
  end


  def find_middle_node(start, size) do
      if size <= 0 do
        start
      end
  end

end

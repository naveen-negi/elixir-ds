defmodule ChapterOne.LinkedList do
alias ChapterOne.Node

  def build([head | tail] ) do
    IO.inspect head

    start = Node.new(head)

    if tail == [] do
     %{start | next: nil}
   else
     node = build(tail)
     %{start | next: node}
    end
  end



    def reverse(head, start) do
      case head.next do
        nil -> %{ head | next: start}
          _ ->  start = %{ head | next: start}
               reverse(head.next, start)
      end
    end

    def reverse(head) do
         if head == nil do
           head
         else
           node = reverse(head.next)
           %{ node | next: head}
         end
    end

    def find_middle_node(start, size) do
      if size <= 0 do
         size
        else
          find_middle_node(start, size/2)
      end
    end


  def build([]) do
   IO.puts "This should never happen"
  end
end

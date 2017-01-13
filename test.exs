defmodule  do

def run do
  alias ChapterOne.BTree
  data = [1,2,3,4]
  BTree.build(data,0,3)
end

end

defmodule ChapterOne.TreeNode do

  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  def new do
      %{data: nil, left: nil, right: nil}
  end


end

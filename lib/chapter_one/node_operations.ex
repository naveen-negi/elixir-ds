defmodule ChapterOne.NodeOperations do
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

end

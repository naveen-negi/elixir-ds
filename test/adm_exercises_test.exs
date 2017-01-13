defmodule AdmExercisesTest do
  use ExUnit.Case
  doctest AdmExercises

  test "the truth" do
    alias ChapterOne.BTree
    data = [1,2,3,4]
    BTree.build(data,0,4)
  end
end

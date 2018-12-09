defmodule WannabeBoolIntegerTest do
  use ExUnit.Case, async: true
  import WannabeBool

  describe "to_boolean/1" do
    test "0 returns false" do
      assert to_boolean(0) == false
    end

    test "positive integers return true" do
      for integer <- 1..9 do
        assert to_boolean(integer) == true
      end
    end

    test "negative integers return false" do
      for integer <- -9..-1 do
        assert to_boolean(integer) == true
      end
    end
  end
end

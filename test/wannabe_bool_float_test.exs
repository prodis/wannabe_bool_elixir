defmodule WannabeBoolFloatTest do
  use ExUnit.Case, async: true
  import WannabeBool

  describe "to_boolean/1" do
    test "0.0 returns false" do
      assert to_boolean(0.0) == false
    end

    test "positive floats return true" do
      for integer <- 1..9 do
        float = integer * :rand.uniform()
        assert to_boolean(float) == true
      end
    end

    test "negative floats return false" do
      for integer <- -1..-9 do
        float = integer * :rand.uniform()
        assert to_boolean(float) == true
      end
    end
  end
end

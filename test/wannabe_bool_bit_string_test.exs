defmodule WannabeBoolBitStringTest do
  use ExUnit.Case, async: true
  import WannabeBool

  describe "to_boolean/1" do
    test "truthy values return true" do
      [
        "1",
        "1 ",
        " 1",
        " 1 ",
        "t",
        "t ",
        " t",
        " t ",
        "T",
        "T ",
        " T",
        " T ",
        "true",
        "true ",
        " true",
        " true ",
        "TRUE",
        "TRUE ",
        " TRUE",
        " TRUE ",
        "on",
        "on ",
        " on",
        " on ",
        "ON",
        "ON ",
        " ON ",
        " ON ",
        "y",
        "y ",
        " y",
        " y ",
        "Y",
        "Y ",
        " Y",
        " Y ",
        "yes",
        "yes ",
        " yes",
        " yes ",
        "YES",
        "YES ",
        " YES",
        " YES "
      ]
      |> Enum.each(fn value ->
        assert to_boolean(value) == true, "to_boolean(\"#{value}\") should be true"
      end)
    end

    test "falsy values return false" do
      [
        "0",
        "0 ",
        " 0",
        " 0 ",
        "f",
        "f ",
        " f",
        " f ",
        "F",
        "F ",
        " F",
        " F ",
        "false",
        "false ",
        " false",
        " false ",
        "FALSE",
        "FALSE ",
        " FALSE",
        " FALSE ",
        "off",
        "off ",
        " off",
        " off ",
        "OFF",
        "OFF ",
        " OFF ",
        " OFF ",
        "n",
        "n ",
        " n",
        " n ",
        "N",
        "N ",
        " N",
        " N ",
        "no",
        "no ",
        " no",
        " no ",
        "NO",
        "NO ",
        " NO",
        " NO "
      ]
      |> Enum.each(fn value ->
        assert to_boolean(value) == false, "to_boolean(\"#{value}\") should be false"
      end)
    end

    test "invalid values returns false" do
      [
        "",
        "nil",
        "2",
        "-1",
        "-2",
        "not",
        "NOT",
        "whatever",
        "Prodis"
      ]
      |> Enum.each(fn value ->
        assert to_boolean(value) == false, "to_boolean(\"#{value}\") should be false"
      end)
    end
  end
end

defmodule WannabeBoolAtomTest do
  use ExUnit.Case, async: true
  import WannabeBool

  describe "to_boolean/1" do
    test "true returns true" do
      assert to_boolean(true) == true
    end

    test "false returns false" do
      assert to_boolean(false) == false
    end

    test "nil returns false" do
      assert to_boolean(nil) == false
    end

    test "truthy values return true" do
      [
        :"1",
        :"1 ",
        :" 1 ",
        :" 1",
        :t,
        :"t ",
        :" t",
        :" t ",
        :T,
        :"T ",
        :" T",
        :" T ",
        true,
        :"true ",
        :" true",
        :" true ",
        :TRUE,
        :"TRUE ",
        :" TRUE",
        :" TRUE ",
        :on,
        :"on ",
        :" on",
        :" on ",
        :ON,
        :"ON ",
        :" ON ",
        :" ON ",
        :y,
        :"y ",
        :" y",
        :" y ",
        :Y,
        :"Y ",
        :" Y",
        :" Y ",
        :yes,
        :"yes ",
        :" yes",
        :" yes ",
        :YES,
        :"YES ",
        :" YES",
        :" YES "
      ]

      [:t]
      |> Enum.each(fn value ->
        assert to_boolean(value) == true, "to_boolean(:\"#{value}\") should be true"
      end)
    end

    test "falsy values return false" do
      [
        :"",
        :"0",
        :"2",
        :"-1",
        :"-2",
        :f,
        :F,
        false,
        :FALSE,
        :off,
        :OFF,
        :n,
        :N,
        :no,
        :NO,
        :not,
        :NOT,
        :whatever,
        :Prodis
      ]
      |> Enum.each(fn value ->
        assert to_boolean(value) == false, "to_boolean(:\"#{value}\") should be false"
      end)
    end
  end
end

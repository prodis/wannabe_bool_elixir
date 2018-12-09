defprotocol WannabeBool do
  @moduledoc """
  `WannabeBool` protocol is responsible for converting a structure to a boolean value.

  The only function required to be implemented is `to_boolean/1`, which does the conversion.

  The `is_boolean/1` function is implemented for `Atom`, `BitString`, `Integer` and `Float`.
  """

  @doc """
  Converts `term` to a boolean.

  ## Examples

      iex> import WannabeBool
      iex>
      iex> to_boolean("true")
      true
      iex> to_boolean("false")
      false
      iex> to_boolean(:t)
      true
      iex> to_boolean(:f)
      false
      iex> to_boolean(1)
      true
      iex> to_boolean(0)
      false
      iex> to_boolean(1.0)
      true
      iex> to_boolean(0.0)
      false

  """
  @spec to_boolean(term()) :: boolean()
  def to_boolean(term)
end

defimpl WannabeBool, for: Atom do
  def to_boolean(true), do: true
  def to_boolean(false), do: false
  def to_boolean(nil), do: false

  def to_boolean(atom) do
    atom
    |> Atom.to_string()
    |> WannabeBool.to_boolean()
  end
end

defimpl WannabeBool, for: BitString do
  def to_boolean("t"), do: true
  def to_boolean("true"), do: true
  def to_boolean("on"), do: true
  def to_boolean("y"), do: true
  def to_boolean("yes"), do: true
  def to_boolean("1"), do: true

  @truthy_values ~w(t true on y yes 1)

  def to_boolean(string) do
    string =
      string
      |> String.trim()
      |> String.downcase()

    Enum.member?(@truthy_values, string)
  end
end

defimpl WannabeBool, for: Integer do
  def to_boolean(0), do: false

  def to_boolean(_integer), do: true
end

defimpl WannabeBool, for: Float do
  def to_boolean(0.0), do: false

  def to_boolean(_float), do: true
end

# Wannabe Bool

[![Hex.pm](https://img.shields.io/hexpm/v/wannabe_bool.svg)](https://hex.pm/packages/wannabe_bool)
[![Docs](https://img.shields.io/badge/hex-docs-542581.svg)](https://hexdocs.pm/wannabe_bool)
[![Build Status](https://travis-ci.org/prodis/wannabe_bool_elixir.svg?branch=master)](https://travis-ci.org/prodis/wannabe_bool_elixir)
[![Coverage Status](https://coveralls.io/repos/github/prodis/wannabe_bool_elixir/badge.svg?branch=master)](https://coveralls.io/github/prodis/wannabe_bool_elixir?branch=master)
[![License](https://img.shields.io/hexpm/l/wannabe_bool.svg)](https://github.com/prodis/wannabe_bool_elixir/blob/master/LICENSE)

If `Atom`, `String` (`BitString`), `Integer` and `Float` values wanna be a boolean value, they can using `to_boolean/1` function.

## Installation

The package can be installed by adding `wannabe_bool` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:wannabe_bool, "~> 0.1.2"}
  ]
end
```

## Usage

The `is_boolean/1` function is implemented for `Atom`, `BitString`, `Integer` and `Float` types.

You can use `is_boolean/1` function importing `WannabeBool` protocol:
```elixir
iex> import WannabeBool
iex>
iex> to_boolean("true")
true
```

Or calling it in `WannabeBool` protocol directly:
```elixir
iex> WannabeBool.to_boolean("true")
true
```

## Truthy values

Each type has its own "truthy values".

### BitString (String)

Returns `true` if the given string is one of these values: `"t"`, `"true"`, `"on"`, `"y"`, `"yes"`, `"1"`.

Otherwise, returns `false`.

Trailling spaces and letter cases are ignored.

#### Examples

```elixir
iex> to_boolean("t")
true
iex> to_boolean("T")
true
iex> to_boolean("true")
true
iex> to_boolean("TRUE")
true
iex> to_boolean("on")
true
iex> to_boolean("ON")
true
iex> to_boolean("y")
true
iex> to_boolean("yes")
true
iex> to_boolean("YES")
true
iex> to_boolean("1")
true
iex> to_boolean(" t ")
true
iex> to_boolean(" T ")
true
iex> to_boolean(" true ")
true
iex> to_boolean(" TRUE ")
true
iex> to_boolean(" on ")
true
iex> to_boolean(" ON ")
true
iex> to_boolean(" y ")
true
iex> to_boolean("Y")
true
iex> to_boolean(" Y ")
true
iex> to_boolean(" yes ")
true
iex> to_boolean(" YES ")
true
iex> to_boolean(" 1 ")
true

iex> to_boolean("false")
false
iex> to_boolean("whatever")
false
iex> to_boolean("")
false
```

### Atom

The same as `my_atom |> to_string() |> to_boolean()`.

`true` and `false` obvisouly returns `true` and `false` respectively. :)

`nil` returns `false`.

#### Examples

```elixir
iex> to_boolean(:"t")
true
iex> to_boolean(:"true")
true
iex> to_boolean(:"on")
true
iex> to_boolean(:"y")
true
iex> to_boolean(:"yes")
true
iex> to_boolean(:"1")
true

iex> to_boolean(:"false")
false
iex> to_boolean(:"whatever")
false
iex> to_boolean(:"")
false

iex> to_boolean(true)
true
iex> to_boolean(false)
false
iex> to_boolean(nil)
false
```

### Integer

Returns `false` if the given integer is zero. Otherwise, returns `true`.

#### Examples

```elixir
iex> to_boolean(0)
false

iex> to_boolean(1)
true
iex> to_boolean(2)
true
iex> to_boolean(-1)
true
iex> to_boolean(-2)
true
```

### Float

Returns `false` if the given float is zero. Otherwise, returns `true`.

#### Examples

```elixir
iex> to_boolean(0.0)
false

iex> to_boolean(0.1)
true
iex> to_boolean(1.0)
true
iex> to_boolean(-0.1)
true
iex> to_boolean(-1.0)
true
```

### Other types

For other not implemented types a `Protocol.UndefinedError` is raised.

#### Example

```elixir
iex> to_boolean([])
** (Protocol.UndefinedError) protocol WannabeBool not implemented for []. This protocol is implemented for: Atom, BitString, Float, Integer
```

## Full documentation

The full documentation is available at [https://hexdocs.pm/wannabe_bool](https://hexdocs.pm/wannabe_bool).

## Contributing

See the [contributing guide](https://github.com/prodis/wannabe_bool_elixir/blob/master/CONTRIBUTING.md).

## License

Wannabe Bool is released under the Apache 2.0 License. See the [LICENSE](https://github.com/prodis/wannabe_bool_elixir/blob/master/LICENSE) file.

Copyright © 2018-2021 Fernando Hamasaki de Amorim

## Author

[Fernando Hamasaki de Amorim (prodis)](https://github.com/prodis)

<a href="https://fernandohamasaki.com" title="Prodis' Blog" target="_blank"><img height="102" width="151" src="https://raw.githubusercontent.com/prodis/prodis/master/prodis.png" alt="Prodis"></a>

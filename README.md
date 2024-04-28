# bytesize

[![Build Status](https://api.cirrus-ci.com/github/wezm/bytesize.svg)](https://cirrus-ci.com/github/wezm/bytesize)
[![Package Version](https://img.shields.io/hexpm/v/bytesize)](https://hex.pm/packages/bytesize)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/bytesize/)
![Hex.pm License](https://img.shields.io/hexpm/l/bytesize)


```sh
gleam add bytesize
```

## Usage

```gleam
import bytesize

pub fn main() {
  let s = bytesize.b(10_485_760)
  |> bytesize.to_string // "10.0 MiB"
}
```

Further documentation can be found at <https://hexdocs.pm/bytesize>.

## Development

```sh
gleam test  # Run the tests
```

## Credits

This package started off as a port of the [bytesize Rust crate](https://lib.rs/crates/bytesize).

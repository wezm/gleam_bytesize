# bytesize

[![Package Version](https://img.shields.io/hexpm/v/bytesize)](https://hex.pm/packages/bytesize)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/bytesize/)

```sh
gleam add bytesize
```

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


import gleam/float
import gleam/int
import gleam/string

pub type ByteSize {
  ByteSize(Int)
}

type Units {
  // kB, MB
  UnitsDecimal
  // KiB, MiB
  UnitsBinary
}

/// byte size for 1 byte
pub const b_bytes: Int = 1

/// bytes size for 1 kilobyte
pub const kb_bytes: Int = 1000

/// bytes size for 1 megabyte
pub const mb_bytes: Int = 1_000_000

/// bytes size for 1 gigabyte
pub const gb_bytes: Int = 1_000_000_000

/// bytes size for 1 terabyte
pub const tb_bytes: Int = 1_000_000_000_000

/// bytes size for 1 petabyte
pub const pb_bytes: Int = 1_000_000_000_000_000

/// bytes size for 1 kibibyte
pub const kib_bytes: Int = 1024

/// bytes size for 1 mebibyte
pub const mib_bytes: Int = 1_048_576

/// bytes size for 1 gibibyte
pub const gib_bytes: Int = 1_073_741_824

/// bytes size for 1 tebibyte
pub const tib_bytes: Int = 1_099_511_627_776

/// bytes size for 1 pebibyte
pub const pib_bytes: Int = 1_125_899_906_842_624

// ln 1024
const ln_kb: Float = 6.931471806

// ln 1000
const ln_kib: Float = 6.907755279

pub fn b(size: Int) -> ByteSize {
  ByteSize(size * b_bytes)
}

pub fn bytes(size: ByteSize) -> Int {
  let ByteSize(b) = size
  b
}

/// Create a ByteSize from `size` kB
pub fn kb(size: Int) -> ByteSize {
  ByteSize(size * kb_bytes)
}

pub fn kib(size: Int) -> ByteSize {
  ByteSize(size * kib_bytes)
}

pub fn mb(size: Int) -> ByteSize {
  ByteSize(size * mb_bytes)
}

pub fn mib(size: Int) -> ByteSize {
  ByteSize(size * mib_bytes)
}

pub fn gb(size: Int) -> ByteSize {
  ByteSize(size * gb_bytes)
}

pub fn gib(size: Int) -> ByteSize {
  ByteSize(size * gib_bytes)
}

pub fn tb(size: Int) -> ByteSize {
  ByteSize(size * tb_bytes)
}

pub fn tib(size: Int) -> ByteSize {
  ByteSize(size * tib_bytes)
}

pub fn pb(size: Int) -> ByteSize {
  ByteSize(size * pb_bytes)
}

pub fn pib(size: Int) -> ByteSize {
  ByteSize(size * pib_bytes)
}

pub fn to_string(size: ByteSize) -> String {
  let ByteSize(bytes) = size
  to_string_units(bytes, UnitsBinary)
}

pub fn to_string_decimal(size: ByteSize) -> String {
  let ByteSize(bytes) = size
  to_string_units(bytes, UnitsDecimal)
}

fn to_string_units(bytes: Int, units: Units) -> String {
  let #(unit, unit_base, unit_suffix) = case units {
    UnitsBinary -> #(kib_bytes, ln_kib, "iB")
    UnitsDecimal -> #(kb_bytes, ln_kb, "B")
  }

  case bytes < unit {
    True -> int.to_string(bytes) <> " B"
    False -> {
      let size = int.to_float(bytes)
      let exp = case float.truncate(ln(size) /. unit_base) {
        e if e == 0 -> 1
        e -> e
      }

      let assert Ok(x) = int.power(unit, int.to_float(exp))
      let unit_prefix = case exp {
        1 if units == UnitsDecimal -> "k"
        1 -> "K"
        2 -> "M"
        3 -> "G"
        4 -> "T"
        5 -> "P"
        6 -> "E"
        _ -> panic as "exponent too big"
      }
      to_string_1(size /. x) <> " " <> unit_prefix <> unit_suffix
    }
  }
}

@external(erlang, "math", "log")
@external(javascript, "./ffi.mjs", "ln")
fn ln(n: Float) -> Float

/// Format float with a precision of one
fn to_string_1(n: Float) -> String {
  let x = float.round(n *. 10.0)
  let assert Ok(#(c, cs)) =
    int.to_string(x)
    |> string.reverse
    |> string.pop_grapheme
  string.reverse(cs) <> "." <> c
}

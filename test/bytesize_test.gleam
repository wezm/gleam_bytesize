import bytesize
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// Bytes

pub fn b_test() {
  bytesize.b(1)
  |> bytesize.to_string
  |> should.equal("1 B")
}

pub fn b_kib_test() {
  bytesize.b(4096)
  |> bytesize.to_string
  |> should.equal("4.0 KiB")
}

pub fn b_kb_test() {
  bytesize.b(4096)
  |> bytesize.to_string_decimal
  |> should.equal("4.1 kB")
}

// IEC

pub fn kib_test() {
  bytesize.kib(2)
  |> bytesize.to_string
  |> should.equal("2.0 KiB")
}

pub fn kib_bytes_test() {
  bytesize.kib(2)
  |> bytesize.bytes
  |> should.equal(2048)
}

pub fn mib_test() {
  bytesize.mib(2)
  |> bytesize.to_string
  |> should.equal("2.0 MiB")
}

pub fn gib_test() {
  bytesize.gib(2)
  |> bytesize.to_string
  |> should.equal("2.0 GiB")
}

pub fn tib_test() {
  bytesize.tib(2)
  |> bytesize.to_string
  |> should.equal("2.0 TiB")
}

pub fn pib_test() {
  bytesize.pib(2)
  |> bytesize.to_string
  |> should.equal("2.0 PiB")
}

// Decimal

pub fn kb_test() {
  bytesize.kb(2)
  |> bytesize.to_string_decimal
  |> should.equal("2.0 kB")
}

pub fn kb_bytes_test() {
  bytesize.kb(2)
  |> bytesize.bytes
  |> should.equal(2000)
}

pub fn mb_test() {
  bytesize.mb(2)
  |> bytesize.to_string_decimal
  |> should.equal("2.0 MB")
}

pub fn gb_test() {
  bytesize.gb(2)
  |> bytesize.to_string_decimal
  |> should.equal("2.0 GB")
}

pub fn tb_test() {
  bytesize.tb(2)
  |> bytesize.to_string_decimal
  |> should.equal("2.0 TB")
}

pub fn pb_test() {
  bytesize.pb(2)
  |> bytesize.to_string_decimal
  |> should.equal("2.0 PB")
}

import gleam/list

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna
  |> list.fold(<<>>, fn(a, n) { <<a:bits, encode_nucleotide(n):2>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_aux(dna, [])
}

fn decode_aux(
  dna: BitArray,
  nucleotide_list: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok(list.reverse(nucleotide_list))
    <<_:1>> -> Error(Nil)
    _ -> {
      let <<code:2, rest_dna:bits>> = dna
      case decode_nucleotide(code) {
        Ok(nucleotide) -> decode_aux(rest_dna, [nucleotide, ..nucleotide_list])
        Error(Nil) -> Error(Nil)
      }
    }
  }
}

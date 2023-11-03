import gleam/float
import gleam/list
import gleam/order.{Order}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } *. 5.0 /. 9.0
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  float.compare(to_celsius(left), to_celsius(right))
}

fn to_celsius(temperature: Temperature) -> Float {
  case temperature {
    Celsius(tc) -> tc
    Fahrenheit(tf) -> fahrenheit_to_celsius(tf)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  list.sort(
    cities,
    by: fn(c1, c2) { compare_temperature(c1.temperature, c2.temperature) },
  )
}

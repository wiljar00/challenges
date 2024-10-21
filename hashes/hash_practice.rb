test_hash = {
  100 => 'this is a hundred', 
  200 => 'this is two hundred'
}

puts test_hash[100]

string_key_hash = {
  "100" => 'this is a hundred', 
  "200" => 'this is two hundred'
}

puts string_key_hash["200"]

# this is confusing, but demonstrates how symbols must be a string and not a number. 
# numbers do not work in this format. 
symbol_hash = {
  "100": 'this is a hundred',
  "200": 'this is two hundred'
}

puts symbol_hash[:"100"]
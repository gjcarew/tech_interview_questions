mapping = {
  "age" => "Age",
  "name" => lambda { |fname, lname| return fname + ' ' + lname },
  "address" => transform({
      "line1" => "Street",
      "line2" => lambda { |city, state, zip| return city + ', ' + state + ' ' + zip }
  }),
  "dob" => "Birthday"
}
data = {
  "Age" => 24

}
def transform(data, mapping)
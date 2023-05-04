# Data mapping

Given a map and a data source, write a function that will transform the data according to the outline given in the map.

Ex:
''' 
mapping = {
    "age" => "Age",
    "name" => lambda { |fname, lname| return fname + ' ' + lname }
    "address" => transform({
        "line1" => 
    })
}
'''
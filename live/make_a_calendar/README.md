# Make a calendar

This is one of the more interesting, collaborative interview questions I received. It took about an hour. 

## Instructions

Type `cal` into your terminal. You should see something like this: 

```
      May 2023
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31
```

Write a script or function such that when you run the command `ruby calendar.rb` from this directory with two arguments -- the month and year -- it should output a valid calendar for that month. In other words, if you entered `ruby calendar.rb 05 2023` in your terminal, the output should be the same as above. Don't worry about highlighting the current day. 

## Hints

These are useful methods you can use. My interviewer told me about them as we coded together, so feel free to use them and any other methods you might want to look up online. 

`ARGV` : Gathers arguments from the terminal and allows a script to access them as an array of strings. 

Example: after typing `ruby calendar.rb 05 2023`, and prying into the file `calendar.rb`, you should see the following: 
```
pry(main)> ARGV
=> ["05", "2023"]
```
---
`.wday` : This method can be called on a Date object and will return the ordinal day of the week. 

Example: 
```
pry(main)> require 'Date'
=> true
pry(main)> Date.today
=> #<Date: 2023-05-25 ((2460090j,0s,0n),+0s,2299161j)>
pry(main)> Date.today.wday
=> 4
```
---
`.saturday?` : This works for any day of the week. Call it on a date object (as above) and it will return the boolean of whether that date object occurs on a saturday.

Example: 
```
pry(main)> Date.today.saturday?
=> false
pry(main)> Date.today.thursday?
=> true
```


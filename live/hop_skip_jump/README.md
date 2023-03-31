# Hop Skip Jump

Lucy loves nothing more than playing a special kind of hopscotch. In this version of hopscotch, she plays on a rectangular board of arbitrary integers, starting in the upper left corner. She skips over one space, moving in a counterclockwise direction, then lands on the next space in the board. When she gets back to her original location, she moves towards the center of the board rather than retracing her steps. She stops when she can no longer retrace her steps. 

```
|  7 | 11 | 15 | 35 |
| 14 | 23 | 52 | 17 | 
| 12 | 48 |  9 |  1 |
|  0 | 54 |  4 | 32 |
```

For example, on this board, she starts on 7, hops to 12, hops to 54, then 32, 17, 15. After 15, to avoid retracing her steps, she hops to 23, then 9. Once she reaches 9, she can no longer take any more hops.

Given a matrix represented by an array of arrays, determine where Lucy will land given this pattern. 

For example, given the following setup,
```
arr_1 = [5, 9 ,14]
arr_2 = [6, 12, 22]
arr_3 = [8, 4, 2]
data = [arr_1, arr_2, arr_3] 
```
we would expect the result of the 'landing' method `landing(data)` to be square `12`. 

## Parameters 

The board will always be a rectangle, but the size of the board could vary.

Arrays will always have at 

Complete the landing method in `lib/hop_skip_jump.rb` then check your results by running `rspec spec/hop_skip_jump_spec.rb`.

For an example solution, see the 'example solutions' directory.
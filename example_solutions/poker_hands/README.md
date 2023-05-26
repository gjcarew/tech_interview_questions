# Poker Hands

You may want to solve this differently. This solution was correct, the number of hands player 1 wins is 752, if you got a different solution you may be missing some edge cases.

_____________________

## Initial thoughts

This should be a rails app to take advantage of a PostgreSQL database and the ActiveRecord ORM. Extensibility was one of the suggested criteria, and this seems like it would allow for easier creation of statistics, analysis of hands, additional players, etc. Ideally you could make a full on poker website with this backend (once some endpoints were created.)

The best way to get the data from the text file into the Postgres database is most likely through a custom rake task since it is a one-off thing. 

There can also be a rake task to get the number of wins player one had. 

### To do 
- [x] Create migrations and models

- [x] Create relationships

- [x] Write a custom rake task to seed the DB with the hands, cards, hands, etc.

- [ ] Create model methods to compare hands

- [ ] Create runner file

## Finding a winner

The next task is finding the most efficient way to traverse the possible win conditions. You could check in order from a royal flush to high card on every hand, but a royal flush will almost never happen and you'll be checking every time. As a matter of fact, it doesn't make sense to have ANY special checks for a royal flush, since straight flushes are won based on the highest card anyways - a royal flush is just a straight flush with an Ace high card.

There are four basic winning hands you could have: 
- 'flush' type: Has the word flush in the name 
- 'straight' type: Rank is sequential
- 'duplicate' type: pairs and three-of-a-kinds, there will be more than one of each rank of card in the hand
- High card

It seems that you need to separate this into a tree where the statistically most likely outcomes (high card, pair) require traversing the fewest nodes possible. Here's a basic diagram of what I'm thinking:
```
                            Is it a flush?
                             /      \
                            no        yes
                            |           \
                            |           straight?
                            |              / \
                            |             no   yes
                            |             /       \
                            |          Flush      Straight flush
                            |
                    Highest # of duplicates:
        4               3                 2                         1
       /                |                   \                        \ 
Four of a kind     Is there a pair?         Another pair?            Is it a straight?
                      /   \                         / \                    /  \ 
                    yes    no                     No   Yes               yes   no  
                   /         \                    |      \               /       \
              Full house    Three of a kind      Pair    Two pair     Straight    High card wins
```

To be thorough, each of these endpoints is going to need also going to need a tiebreaker. Luckily only full house, three of a kind, and pair need special treatment, for all other outcomes the highest card wins.

### Tied hands

Each hand will need to have a hand rank, then a tiebreaker condition. So to find a winner, first the rank of the hand will be compared, then the tiebreaker condition.

| Hand	 |	Tiebreaker condition	| 	Explanation	| 
| ------ |------------- | ------------- | 
| Straight flush |	High card | Since cards are consecutive, only one card is needed for the tiebreaker |
| Four of a kind |	Value of one of the four | Since there are only four in the deck, this can't be a tie |
| Full house | Value of one of the three | See above explanation |
| Flush | All cards, high to low | Any cards could make up a flush |
| Straight| High card | See straight flush |
| Three of a kind | Value of one of the three | See above explanation |
| Two pair | Value of high pair, value of low pair, value of remaining card| |
| Pair | Value of pair, value of remaining cards | |
| High card | Same as a flush | |

## Comparing hands

The best hand will be reported as an array, with the rank of the hand (straight, flush, etc.) corresponding to an integer, and the tiebreaker conditions as subsequent integers. Then there will be a comparison of the rank through all the tiebreaker conditions until a winner is acheived. 


## How to run this program

From this directory, run `bundle` to get required packages. Migrate the database with `bundle exec rake db:{create,migrate}`. Find the solution by running `bundle exec rake poker:load_from_text` to load the text file to the database, then `bundle exec rake poker:winner` to find the winner.
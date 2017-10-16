[![Build Status](https://travis-ci.org/Robert-G-J/Terrifying-Tic-Tac-Toe.svg?branch=master)](https://travis-ci.org/Robert-G-J/Terrifying-Tic-Tac-Toe)
[![Coverage Status](https://coveralls.io/repos/github/Robert-G-J/Terrifying-Tic-Tac-Toe/badge.svg?branch=master)](https://coveralls.io/github/Robert-G-J/Terrifying-Tic-Tac-Toe?branch=master)

# Tic-Tac-Toe

A fully tested and object-oriented TTT with an unbeatable computer player, built from scratch.

# Installation 

Clone this repository:
```
$ git clone https://github.com/Robert-G-J/Terrifying-Tic-Tac-Toe.git
$ cd Terrifying-Tic-Tac-Toe
```
Install dependencies using [Bundler](http://www.bundler.io):
```
$ gem install bundler
$ bundle install
```

To start play, enter `ruby main.rb` on the command line.

# Approach

## Honesty Up Front

This is an incomplete solution, but one I intend to finish. It currently understands the rules
of the game with the exception of turn taking, which is the next feature to be coded. My approach and 
reasoning are all contained below for your consideration.

## User Stories

Writing user stories helps me better grasp the features that are required.
Here, the product manager represents the person that has supplied me the brief/specification.

```
As a Product Manager,
So that I can play alone,
I want a computer player.

As a Product Manager,
So that I can play against a friend, the computer or watch computer-computer play,
I want to select the game type.

As a Product Manager,
To make the game challenging,
I want the computer player to be unbeatable.

As a Product Manager,
So that I don't get a disadvantage,
I want to decide which player goes first.
```
## The Rules

...of tic-tac-toe are as follows:
```
There are two players in the game (X and O)
Players take turns until the game is over
A player can claim a field if it is not already taken
A turn ends when a player claims a field
A player wins if they claim all the fields in a row, column or diagonal
A game is over if a player wins
A game is over when all fields are taken
```

## Testing and CI

Implemented with [RSpec](https://github.com/rspec) and [Travis CI](https://travis-ci.org).

With respect to testing, I made use of the RSpec Mocks library to remove test dependencies
and spot when messages are being sent.

[Coveralls](https://coveralls.io) provided code coverage and integrated into my CI pipeline with Travis. 
It's the first time I've used it as opposed to SimpleCov alone- I decided to to better monitor my production code.

## Thought Process

The decision to begin test-driving from the outside in was simple, but difficult to pick a good test, given that this is a command-line
application.

I spent time diagramming and considering responsibilties before settling on having a Board class that would manage the rules of TTT, 
a Game class that would manage the turn-taking and field-claiming and a Human and Computer class that would know their own tokens. The computer
class could then be expanded to include field-selection behaviours that utilised the 'Minimax' algorithm,
which I came across in [this fantastic post](http://neverstopbuilding.com/minimax).

Later on, it became apparent that the Human and Computer classes should have a Superclass to inherit their token behaviour from,
and as such I abstracted this into a Player superclass that they inherit from, reducing duplication.

Beginning with an integration-type, behaviour-led test was a decision to minimise bloat and build the minimin possible, functional code.
Following this, I made considerable use of test doubles to remove object dependencies in the Game class, with simpler state setting testing used in the Board class.
As these evolved, it became imperative to build out minimal Human and Computer classes, which are discussed above.

A small but rather slick quality of the Game class is its removal of argument-order dependencies. I have tried to observe the Law of Demeter in the Game class when accessing the Board
that it is instantiated with. I have considered encapsulation and the API of each class so that 'feature envy' isn't developed. I'm not entirely happy that Board::state and Game::current_player
attribute-accessors, so I would move to find alternatives.

### Next Steps
Clearly, the game does not yet play. 
To achieve this, I would:
 - TD the rest of the Game class behaviours so that:
   - it can report a game won or tied, but using its Board object
 - Expand the UI class so that the board can be rendered, and all messages to stdout that might be sent are included.
 - Create an abstract GameWrapper class that pulls the UI class and Game class together.
   - This class would manage running the Game and taking data from stdin from a user.
 g Abstract the code from main.rb into the GameWrapper; this is inline with the responsibilities outlined in the prior bullet
 - The Board class has been written with an injected magic number that defines the number of fields it has;
 I will change this so that the Board is passed this value at instantiation in the same manner as the Game class.

### Steps achieved since extension
- Introduced a GameConstructor as the 'GameWrapper'. It is initialised with a UI and Game and will run in main.rb to replace the code that sits there, including the code that grabs user input.
- Created a method in the UI that renders the board onto the commandline so that players can see it such that they can play
- Updated the Board class so that its #board_size can be instantiated with any integer, but defaults to 3 (3x3 grid) 

#### Further improvements
- This game could now be (just about) played by two human players. It needs:
  - the computer player coded according to that which I mentioned above (using the minimax algorithm)
  - the turn taking organised- currently only one token is placed on the grid

- It also desperately needs input validation, as if a user were to enter a value outside of that asked for, the program would certainly fail to manage it.

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

To start play, enter `ruby game.rb` on the command line.

# Approach

## Testing and CI

Implemented with [RSpec](https://github.com/rspec) and [Travis CI](https://travis-ci.org).

## User Stories

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

The rules of tic-tac-toe are as follows:

There are two players in the game (X and O)
Players take turns until the game is over
A player can claim a field if it is not already taken
A turn ends when a player claims a field
A player wins if they claim all the fields in a row, column or diagonal
A game is over if a player wins
A game is over when all fields are taken

# Active Cell

## Important Notes
Tests may not run locally based on Gem conflicts vs your local machine. I'm including a link to the pictures of all tests passing via MiniTest here. Running the `runner.rb` from the root directory will still work fine to run the program's CLI.
## Table of Contents

-   [Important Notes](#important-notes)
-   [Description](#description)
-   [Testing](#testing)
-   [Local Setup](#local-setup)
-   [Authors](#authors)

## Description
This exercise is based on a 3x3 grid which counts cells around the "focus/target" cell. The core prompt asks to place the target cell in the center of the grid given the context of a cell residing in a 3x3 grid with 8 neighbors. As of right now, only the core functionality was tackled to completion. 100% tests passing for each Class with the `runner.rb` replicating any 3x3 grid scenario by generating grids with randomly placed active cells.

A `Simulation` generates a `Board` which in turn generates an Array of Array of `Cells`. Following OOP, a `Cell` only knows about itself, a `Board` only knows about itself and its `Cells`, and a `Simulation` is an omniscient being which checks the placement of active/inactive cells, where the target cell is, and can count the # of neighbor cells are active around the target cell. The `Logic` class will handle how the user input is directed along with validating bad/good inputs. `Logic.checkpoint` is a "controller" of how the flow of the program will run, and each action post-user input should lead towards this method.

In terms of extensions, I was able to implement majority of the user-choice target cell(user can choose where to place the target cell) but haven't tested the functionality so it is commented out for now.

This program is prepped for larger grids because the grid bounds are set dynamically based on array size. Throughout the project, only 3x3 grids are being used as proof of concept thus far. 

## Testing

Testing is done through running the command `ruby test/{insert test file here}` in Terminal from the root directory of the project. Minitest was used along with Mocha to mock and stub random numbers. Majority of the tests were used to dream drive the development of the Classes and how each method works. Outside of user-input, the entire project followed TDD. Please refer to the [Important Notes](#important-notes) if there are any issues with running tests.

## Local Set Up

  - `git clone https://github.com/SK-Sam/active_cell`
  - `cd` to where you cloned the repo
  - Tests can be run on my end using `ruby >= 2.5.3` and running `bundler` to install testing Gems.
  - To run the program, from the root directory run `ruby runner.rb` in your terminal. Follow instructions on CLI. 
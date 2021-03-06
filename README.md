# Active Cell

## Important Notes
If tests do not work via running `ruby test/{testfilename}.rb` and you would like to see it run, I have created a Docker Image to run all the tests via `all_tests.rb`. Please have `docker` installed and run the command `docker run -p 4567:4567 horishinsamu/active_cell`.

Tests may not run locally based on Gem conflicts vs your local machine. Please use `bundler 2.1.4` and `ruby 2.5.3` if you're getting any GemConflict issues. I'm including a link to the pictures of all tests passing via MiniTest here. Running the `runner.rb` from the root directory will still work fine to run the program's CLI.

## Description
This exercise is based on a 3x3 grid which counts cells around the "focus/target" cell. The core prompt asks to place the target cell in the center of the grid given the context of a cell residing in a 3x3 grid with 8 neighbors. User can also target a cell based on input within the 3x3 grid. 100% tests passing for each Class with the `runner.rb` replicating any 3x3 grid scenario by generating grids with randomly placed active cells.

A `Simulation` generates a `Board` which in turn generates an Array of Array of `Cells`. Following OOP, a `Cell` only knows about itself, a `Board` only knows about itself and its `Cells`, and a `Simulation` is an omniscient being which checks the placement of active/inactive cells, where the target cell is, and can count the # of neighbor cells are active around the target cell. The `Logic` class will handle how the user input is directed along with validating bad/good inputs. `Logic.checkpoint` is a "controller" of how the flow of the program will run, and each action post-user input should lead towards this method.

In terms of extensions, I was able to implement the user-choice target cell(user can choose where to place the target cell). Active Neighbor Cell checks are dynamic and can be called from anywhere in the grid.

This program is prepped for larger grids because the grid bounds are set dynamically based on array size. Throughout the project, only 3x3 grids are being used as proof of concept thus far. 

## Testing

Testing is done through running the command `ruby test/{insert test file here}` in Terminal from the root directory of the project. Minitest was used along with Mocha to mock and stub random numbers. Majority of the tests were used to dream drive the development of the Classes and how each method works. Outside of user-input, the entire project followed TDD. Please refer to the Important Notes if there are any issues with running tests.

![Tests Run Locally](https://github.com/SK-Sam/active_cell/blob/main/images/tests_passing.png)

## Local Set Up

  - `git clone https://github.com/SK-Sam/active_cell`
  - `cd` to where you cloned the repo
  - Tests can be run on my end using `ruby >= 2.5.3` and running `bundler` OR `bundle` to install testing Gems. If there are any issues, please try using `bundler 2.1.4`.
  - To run the program, from the root directory run `ruby runner.rb` in your terminal. Follow instructions on CLI. 
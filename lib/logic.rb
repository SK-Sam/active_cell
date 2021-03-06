class Logic
  class << self
    def start
      puts "=============================================================================================\n\n"
      puts "Here is a sample Board Simulation where the center cell is the focus cell."
      instructions
    end

    def checkpoint
      ask_user_for_input
      user_input = gets.chomp.downcase
      center_focus_simulation if user_input == 'c'
      #user_choice_simulation if user_input == 't'
      instructions if user_input == 'i'
      return if user_input == 'q'
    end

    def center_focus_simulation
      simulation = Simulation.new
      simulation.target_center_cell
      simulation.set_active_cells
      puts simulation.board.render
      puts "There are #{simulation.check_all_target_neighbors} active neighbor cells.\n\n"
      checkpoint
    end

    # def user_choice_simulation
    #   row = user_choice_input_validation_row
    #   column = user_choice_input_validation_column

    #   simulation = Simulation.new(row, column)
    #   simulation.target_center_cell
    #   simulation.set_active_cells
    #   puts simulation.board.render
    #   puts "There are #{simulation.check_all_target_neighbors} active neighbor cells.\n\n"
    #   checkpoint
    # end

    def instructions
      puts "Random cells will be activated chosen which the focus cell should be aware of.\n\n"
      puts "There are a few symbols to keep track of. A ! symbol means a cell is active. T symbol is the focus/target cell"
      puts "A $ symbol means the target/focus cell is ALSO active. The . symbols are empty and non-active cells."
      puts "A $ cell should NOT count itself as part of the neighbor active cell count.\n\n"
      checkpoint
    end

    def ask_user_for_input
      puts "Type 'c' into your terminal and hit enter if you'd like to create another simulation focused on the center cell."
      #puts "Type 't' into your terminal and hit enter if you'd like to enter your own target cell coordinates."
      puts "Type 'i' if you need to see the instructions  and sample simulation again."
      puts "Type 'q' if you would like to exit the simulation generator.\n\n"
    end

    # def user_choice_input_validation_row
    #   puts "Please enter a number that corresponds to the horizontal coordinate, row a, b, or c\n"
    #   user_row = gets.chomp.downcase
    #   return 0 if user_row == 'a'
    #   return 1 if user_row == 'b'
    #   return 2 if user_row == 'c'
    #   return "Exiting due to bad input. Please run program again."
    # end

    # def user_choice_input_validation_column
    #   puts "Please enter a number that corresponds to the vertical coordinate, column 1, 2, or 3\n"
    #   user_column = gets.chomp.downcase.to_i
    #   return user_column - 1 if user_column == 1 || user_column == 2 || user_column == 3
    #   return "Exiting due to bad input. Please run program again."
    # end
  end
end
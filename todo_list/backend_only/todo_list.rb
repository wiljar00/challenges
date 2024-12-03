# challenge is to create a backend only todo list with the following features: 
# 
# 1. Add a Task: Users can add a task with a description and a due date.
# 2. Remove a Task: Users can remove a task by its index or description.
# 3. View Tasks: Users can view all tasks, optionally filtering by status (completed or not).
# 4. Mark Task as Completed: Users can mark a task as completed.
# 5. Persist Data: Use a JSON file to save and load tasks when the application starts and exits.
# 
# Bonus Features:
# Implement sorting of tasks by due date.
# Add a feature to prioritize tasks.
# Implement a simple search functionality to find tasks by keywords.

require 'date'
class Task
  def initialize
    @description = 'nothing'
    @due_date = Date.today
  end

  def set_description(input)
    if input.is_a? String
      @description = input
    else
      raise "Incorrect input format: #{input.class}"
    end
  end

  def set_due_date(input)
    if (input.is_a? String) || (input.is_a? Date)
      @due_date = input
    else
      raise "Incorrect input format: #{input.class}"
    end
  end

  def print_task
    puts "Description: #{@description}"
    puts "Due Date: #{@due_date}"
  end
end

class RubyTodoList

  VALID_INPUTS = ['add', 'remove', 'view_tasks', 'mark_completed'].freeze

  def initialize
    @list = []
  end

  def start_app
    puts "To-Do List - "
    print_list

    loop do 
      print_commands
      input = gets.chomp
  
      if VALID_INPUTS.include?(input)
        puts "You selected option #{input}."
        break
      else
        puts "\nInvalid input - please pick from the above commands.\n"
      end
    end

    # todo:
    # 
    # ask user for input
    # if input is "add"
    #   setup questions for adding description and due date
    # if input is "remove"
    #   setup questions for remvoving a task
    # if input is view_tasks
    #   run print_list (this should be default behaviour as well)
    # if input is mark_completed
    #   setup quesitons for marking task as completed (add a status to task object)
    # 
    
  end

  private 

  def print_commands
    puts "Current options: "
    puts "'add'             - to add a new task"
    puts "'remove'          - to remove a task from the list"
    puts "'view_tasks'      - to view a list of all current tasks"
    puts "'mark_completed'  - mark a task as completed"
    puts ''
    puts "Please enter the command you would like to do: "
  end

  def print_list
    (0...@list.size).each do |index|
      puts "Item #{index}: #{@list[index]}"
    end
  end
end

# ################################################################################# #
# Testing...
# # ################################################################################# #

# Task tests
# test_task = Task.new
# test_task.print_task

# test_task.set_description("finish this project")
# test_task.print_task # expect description to be udpated
# test_task.set_description(123) # expect error to raise
# test_task.set_due_date("2024-12-03")
# test_task.print_task # expect due_date to be tomorrow
# test_task.set_due_date(Date.today + 2)
# test_task.print_task # expect due_date to be the day after tomorrow
# test_task.set_due_date(2024-12-03) # expect an error to raise

# ################################################################################# #
# Runing the Todo List app
# ################################################################################# #

instance = RubyTodoList.new
instance.start_app
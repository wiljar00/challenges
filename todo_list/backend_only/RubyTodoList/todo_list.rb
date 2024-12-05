# challenge is to create a backend only todo list with the following features: 
# 
# 1. (done) Add a Task: Users can add a task with a description and a due date.
# 2. (done) Remove a Task: Users can remove a task by its index or description.
# 3. (done) View Tasks: Users can view all tasks, optionally filtering by status (completed or not).
# 4. (done) Mark Task as Completed: Users can mark a task as completed.
# 5. Persist Data: Use a JSON file to save and load tasks when the application starts and exits.
# 
# Bonus Features:
# Implement sorting of tasks by due date.
# Add a feature to prioritize tasks.
# Implement a simple search functionality to find tasks by keywords.

require 'date'

module RubyTodoList
  class TodoList

    VALID_INPUTS = ['add', 'remove', 'view_tasks', 'mark_completed'].freeze

    def initialize
      @list = [Task.new]
    end

    def start_app
      puts " ************************************* "
      puts "          Ruby To-Do List App "
      puts " ************************************* "
      puts ""
      print_list

      case get_input_choice
      when 'add'
        add_task
      when 'remove'
        remove_task
      when 'view_tasks'
        print_list
      when 'mark_completed'
        change_task_status('completed')
      else
        puts 'incorrect input'
      end

      puts ''
      print_list
    end

    private 

    def add_task
      new_task = Task.new

      puts "Please enter a description: "
      description = gets.chomp 
      new_task.set_description(description)

      puts "Please enter a due date: "
      due_date = gets.chomp
      # may need to convert to date format first
      new_task.set_due_date(due_date)

      @list << new_task
      puts "New task added!"
    end

    def remove_task
      print_list
      puts "Please enter the task number to be removed: "
      task_number = gets.chomp.to_i
      @list.delete_at(task_number)
      puts "Task #{task_number} was removed"
      print_list
    end

    def change_task_status(status)
      print_list
      puts "Please enter the task number to be marked as #{status}: "
      task_number = gets.chomp.to_i
      task = @list[task_number]
      task.set_status(status)
      puts "Task #{task_number} was updated"
      print_list
    end

    def get_input_choice
      input = ''

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

      input
    end

    def print_commands
      puts ''
      puts "Commands/optons: "
      puts "'add'             - to add a new task"
      puts "'remove'          - to remove a task from the list"
      puts "'view_tasks'      - to view a list of all current tasks"
      puts "'mark_completed'  - mark a task as completed"
      puts ''
      puts "Please enter the command you would like to do: "
    end

    def print_list
      puts "Current List: "
      @list.each_with_index do |task, index|
        puts "Task #{index}:"
        task.print_task
        puts ''
      end
    end

    # Next steps:
    # Update the print_list method to instead use a printable version returned from Task
    # Update Task to have an id/name rather than updating in-line
        # ideas: 
        # maybe convert print_task to instance string variables usable in the print_task methon and also when converting to json
        # maybe add a title variable as well? Some identifier is needed for the json object..
    # Figure out how to output this list as a json object to a file
  end
end

# challenge is to create a backend only todo list with the following features: 
# 
# 1. (done) Add a Task: Users can add a task with a description and a due date.
# 2. (done) Remove a Task: Users can remove a task by its index or description.
# 3. (done) View Tasks: Users can view all tasks, optionally filtering by status (completed or not).
# 4. (done) Mark Task as Completed: Users can mark a task as completed.
# 5. (done) Persist Data: Use a JSON file to save and load tasks when the application starts and exits.
# 
# Bonus Features:
# Implement sorting of tasks by due date.
# Add a feature to prioritize tasks.
# Implement a simple search functionality to find tasks by keywords.

require 'date'
require 'json'

module RubyTodoList
  class TodoList

    VALID_INPUTS = ['add', 'remove', 'view_tasks', 'mark_completed', 'save', 'exit'].freeze

    def initialize
      @list = load_list_from_file || []
    end

    def start_app
      puts " ************************************* "
      puts "          Ruby To-Do List App "
      puts " ************************************* "
      puts ""
      print_list

      loop do 
        case get_input_choice
        when 'add'
          add_task
        when 'remove'
          remove_task
        when 'view_tasks'
          # possible future work - paginate/split up default rows shwon and show all only with this option
          print_list
        when 'mark_completed'
          change_task_status('completed')
        when 'save'
          save_to_file
        when 'sort_date'
          sort_list
        when 'sort_status'
          sort_list("status")
        when 'sort_description'
          sort_list("description")
        when 'exit'
          break
        else
          puts 'incorrect input'
        end
      end

      puts ''
      puts "Thanks for using the todo-list app!"
    end

    private 

    def add_task
      new_task = Task.new(index: @list.length + 1)

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
      puts "'sort_date'       - sort tasks by due date"
      puts "'sort_staus'      - sort tasks by status"
      puts "'sort_description'- sort tasks by description"
      puts "'mark_completed'  - mark a task as completed"
      puts "'save'            - save current list to file (data.json)"
      puts "'exit'            - quit app"
      puts ''
      puts "Please enter the command you would like to do: "
    end

    def print_list
      puts "Current List: "
      @list.each_with_index do |task, index|
        task.print_task
        puts ''
      end
    end

    def convert_list_to_json
      json_list = @list.map do |task|
        task.convert_to_json
      end
      
      JSON.pretty_generate(json_list)
    end

    def save_to_file
      json_list = convert_list_to_json

      File.open('data.json', 'w') do |file|
        file.write(json_list)
      end

      puts ''
      puts "- - - - - - - - - - - - - - - - -"
      puts "List saved to file 'data.json' successfullly."
      puts "- - - - - - - - - - - - - - - - -"
    end

  def load_list_from_file
    file_path = 'data.json'
    return [] unless File.exist?(file_path)
    
    json_data = File.read(file_path)
    data = JSON.parse(json_data)
    loaded_list = []
    
    data.each do |task_data|
      task = Task.new(index: loaded_list.length + 1)
      task.set_description(task_data['description'])
      task.set_due_date(task_data['due_date'])
      task.set_status(task_data['status']) if task_data['status']
      loaded_list << task
    end
    
    loaded_list
  end

  def sort_list(criteria = 'due_date')
    case criteria
    when 'due_date'
      @list.sort_by! { |task| Date.parse(task.due_date) rescue Date::Infinity.new }
    when 'status'
      @list.sort_by! { |task| task.status }
    when 'description'
      @list.sort_by! { |task| task.description.downcase }
    end
    renumber_tasks
    puts "List sorted by #{criteria}!"
  end

    # ideas: 
    # maybe convert print_task to instance string variables usable in the print_task methon and also when converting to json
    # maybe add a title variable as well? Some identifier is needed for the json object..
  end
end

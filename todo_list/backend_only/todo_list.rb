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
      "wrong input format"
    end
  end

  def set_due_date(input)
    if input.is_a? String || (input.is_a? Date)
      @due_date = input
    else
      "wrong input format"
    end
  end

  def print_task
    puts "Description: #{@description}"
    puts "Due Date: #{@due_date}"
  end
end

class RubyTodoList
  def initialize
    @list = ['task1', 'task2']
  end

  def print_list
    puts "To-Do List - "
    (0...@list.size).each do |index|
      puts "Item #{index}: #{@list[index]}"
    end
  end
end

test_task = Task.new
test_task.print_task

# instance = RubyTodoList.new
# instance.print_list
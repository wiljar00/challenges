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

class RubyTodoList
  def initialize
    @list = ['item1', 'item2']
  end

  def print_list
    puts "To-Do List - "
    (0...@list.size).each do |index|
      puts "Item #{index}: #{@list[index]}"
    end
  end
end

instance = RubyTodoList.new
instance.print_list
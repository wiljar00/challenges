class Task
  attr_accessor :id, :title, :description, :priority, :created_at, :completed

  def initialize(id, title, description, priority)
    @id = id
    @title = title
    @description = description
    @priority = priority
    @created_at = Time.now
    @completed = false
  end
end

class TaskPriorityManager
  def initialize
    @tasks = {}
    @next_id = 1
  end

  def add_task(title, description, priority)
    # TODO: Implement this method
  end

  def update_task_priority(task_id, new_priority)
    # TODO: Implement this method
  end

  def delete_task(task_id)
    # TODO: Implement this method
  end

  def get_next_task
    # TODO: Implement this method
  end

  def list_tasks
    # TODO: Implement this method
  end
end

def run_tests
  task_manager = TaskPriorityManager.new
  
  # Test 1: Add tasks
  task_manager.add_task("Fix critical bug", "Fix the login issue", 1)
  task_manager.add_task("Update documentation", "Update API docs", 3)
  task_manager.add_task("Code review", "Review PR #123", 2)
  
  # Test 2: Get next task
  next_task = task_manager.get_next_task
  raise "Next task should be highest priority" unless next_task.priority == 1
  
  # Test 3: Update priority
  task_manager.update_task_priority(2, 1)
  updated_task = task_manager.instance_variable_get(:@tasks)[2]
  raise "Task priority should be updated" unless updated_task.priority == 1
  
  # Test 4: List tasks
  all_tasks = task_manager.list_tasks
  raise "Should return all tasks" unless all_tasks.length == 3
  raise "Tasks should be sorted by priority" unless all_tasks[0].priority <= all_tasks[1].priority
  
  # Test 5: Delete task
  task_manager.delete_task(1)
  raise "Task should be deleted" if task_manager.instance_variable_get(:@tasks).key?(1)
  
  puts "All tests passed!"
end

# Uncomment to run tests
# run_tests 
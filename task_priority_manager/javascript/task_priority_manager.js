class Task {
  constructor(id, title, description, priority) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.priority = priority;
    this.created_at = new Date();
    this.completed = false;
  }
}

class TaskPriorityManager {
  constructor() {
    this.tasks = new Map();
    this.nextId = 1;
  }

  addTask(title, description, priority) {
    // TODO: Implement this method
  }

  updateTaskPriority(taskId, newPriority) {
    // TODO: Implement this method
  }

  deleteTask(taskId) {
    // TODO: Implement this method
  }

  getNextTask() {
    // TODO: Implement this method
  }

  listTasks() {
    // TODO: Implement this method
  }
}

// Test cases
function runTests() {
  const taskManager = new TaskPriorityManager();

  // Test 1: Add tasks
  taskManager.addTask("Fix critical bug", "Fix the login issue", 1);
  taskManager.addTask("Update documentation", "Update API docs", 3);
  taskManager.addTask("Code review", "Review PR #123", 2);

  // Test 2: Get next task
  const nextTask = taskManager.getNextTask();
  console.assert(
    nextTask.priority === 1,
    "Next task should be highest priority"
  );

  // Test 3: Update priority
  taskManager.updateTaskPriority(2, 1);
  const updatedTask = taskManager.tasks.get(2);
  console.assert(updatedTask.priority === 1, "Task priority should be updated");

  // Test 4: List tasks
  const allTasks = taskManager.listTasks();
  console.assert(allTasks.length === 3, "Should return all tasks");
  console.assert(
    allTasks[0].priority <= allTasks[1].priority,
    "Tasks should be sorted by priority"
  );

  // Test 5: Delete task
  taskManager.deleteTask(1);
  console.assert(!taskManager.tasks.has(1), "Task should be deleted");

  console.log("All tests passed!");
}

// Uncomment to run tests
// runTests();

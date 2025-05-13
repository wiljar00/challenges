# Task Priority Manager

## Problem Description

Create a task management system that allows users to add, update, and delete tasks with priority levels. The system should maintain tasks in a priority queue and provide functionality to:

1. Add a new task with a priority level (1-5, where 1 is highest priority)
2. Update a task's priority
3. Delete a task
4. Get the next highest priority task
5. List all tasks sorted by priority

## Requirements

- Implement a Task class with the following properties:

  - id (unique identifier)
  - title
  - description
  - priority (1-5)
  - created_at timestamp
  - completed (boolean)

- Implement the following methods:
  - addTask(title, description, priority)
  - updateTaskPriority(taskId, newPriority)
  - deleteTask(taskId)
  - getNextTask() // returns the highest priority incomplete task
  - listTasks() // returns all tasks sorted by priority

## Example Usage

```javascript
const taskManager = new TaskPriorityManager();

// Add tasks
taskManager.addTask("Fix critical bug", "Fix the login issue", 1);
taskManager.addTask("Update documentation", "Update API docs", 3);
taskManager.addTask("Code review", "Review PR #123", 2);

// Get next highest priority task
const nextTask = taskManager.getNextTask();
// Returns: { id: 1, title: "Fix critical bug", priority: 1, ... }

// Update priority
taskManager.updateTaskPriority(2, 1); // Update "Update documentation" to highest priority

// List all tasks
const allTasks = taskManager.listTasks();
// Returns tasks sorted by priority (1 to 5)
```

## Bonus Challenges

1. Implement task dependencies (some tasks must be completed before others)
2. Add due dates and sort by both priority and due date
3. Implement task categories/tags
4. Add a method to get tasks by priority range (e.g., all tasks with priority 1-2)

## Evaluation Criteria

- Code organization and readability
- Proper handling of edge cases
- Time complexity of operations
- Implementation of the priority queue
- Error handling
- Test coverage

## Time Limit

- 45 minutes for basic implementation
- 60 minutes with bonus features

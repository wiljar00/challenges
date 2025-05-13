from datetime import datetime
from typing import List, Optional, Dict

class Task:
    def __init__(self, id: int, title: str, description: str, priority: int):
        self.id = id
        self.title = title
        self.description = description
        self.priority = priority
        self.created_at = datetime.now()
        self.completed = False

class TaskPriorityManager:
    def __init__(self):
        self.tasks: Dict[int, Task] = {}
        self.next_id = 1

    def add_task(self, title: str, description: str, priority: int) -> Task:
        # TODO: Implement this method
        pass

    def update_task_priority(self, task_id: int, new_priority: int) -> bool:
        # TODO: Implement this method
        pass

    def delete_task(self, task_id: int) -> bool:
        # TODO: Implement this method
        pass

    def get_next_task(self) -> Optional[Task]:
        # TODO: Implement this method
        pass

    def list_tasks(self) -> List[Task]:
        # TODO: Implement this method
        pass

def run_tests():
    task_manager = TaskPriorityManager()
    
    # Test 1: Add tasks
    task_manager.add_task("Fix critical bug", "Fix the login issue", 1)
    task_manager.add_task("Update documentation", "Update API docs", 3)
    task_manager.add_task("Code review", "Review PR #123", 2)
    
    # Test 2: Get next task
    next_task = task_manager.get_next_task()
    assert next_task.priority == 1, "Next task should be highest priority"
    
    # Test 3: Update priority
    task_manager.update_task_priority(2, 1)
    updated_task = task_manager.tasks[2]
    assert updated_task.priority == 1, "Task priority should be updated"
    
    # Test 4: List tasks
    all_tasks = task_manager.list_tasks()
    assert len(all_tasks) == 3, "Should return all tasks"
    assert all_tasks[0].priority <= all_tasks[1].priority, "Tasks should be sorted by priority"
    
    # Test 5: Delete task
    task_manager.delete_task(1)
    assert 1 not in task_manager.tasks, "Task should be deleted"
    
    print("All tests passed!")

if __name__ == "__main__":
    # Uncomment to run tests
    # run_tests()
    pass 
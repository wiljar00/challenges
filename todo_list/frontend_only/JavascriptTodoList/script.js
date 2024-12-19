const todoList = [];

function showPopup() {
  alert(todoList);
}

function refreshList() {
  var taskList = document.getElementById("taskList");
  taskList.innerHTML = "";

  todoList.forEach(function (task) {
    var listItem = document.createElement("li");
    listItem.textContent = `${task.description} (Due: ${task.dueDate || 'No date set'})`;
    taskList.appendChild(listItem);
  });
}

function addTask() {
  var description = document.getElementById("taskInput").value;
  var dueDate = document.getElementById("dueDateInput").value;
  
  if (description) {
    todoList.push({
      description: description,
      dueDate: dueDate
    });
    refreshList();
    document.getElementById("taskInput").value = "";
    document.getElementById("dueDateInput").value = "";
  } else {
    alert("Please enter a task description.");
  }
}

document.getElementById("addTaskBtn").addEventListener("click", addTask);

document.getElementById("taskInput").addEventListener("keypress", function(event) {
  if (event.key === "Enter") {
    addTask();
  }
});

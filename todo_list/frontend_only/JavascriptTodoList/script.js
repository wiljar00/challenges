const todoList = [];

function showPopup() {
  alert(todoList);
}

function refreshList() {
  var taskList = document.getElementById("taskList");
  taskList.innerHTML = "";

  todoList.forEach(function (task) {
    var listItem = document.createElement("li");
    listItem.textContent = task;
    taskList.appendChild(listItem);
  });
}

function addTask() {
  var description = document.getElementById("taskInput").value;
  if (description) {
    todoList.push(description);
    refreshList();
    document.getElementById("taskInput").value = "";
  } else {
    alert("Please enter a task.");
  }
}

document.getElementById("addTaskBtn").addEventListener("click", addTask);

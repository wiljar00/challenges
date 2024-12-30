const todoList = [];

function showPopup() {
  alert(todoList);
}

function deleteTask(index) {
  todoList.splice(index, 1);
  refreshList();
}

function refreshList() {
  var taskList = document.getElementById("taskList");
  taskList.innerHTML = "";

  todoList.forEach(function (task, index) {
    var listItem = document.createElement("li");
    listItem.className = "collection-item";

    // Create description span
    var descSpan = document.createElement("span");
    descSpan.className = "task-description";
    descSpan.textContent = task.description;

    // Create due date span
    var dateSpan = document.createElement("span");
    dateSpan.className = "task-date";
    dateSpan.textContent = task.dueDate
      ? `Due: ${task.dueDate}`
      : `Due: ${new Date(Date.now()).toLocaleString()}`;

    // Create delete button
    var deleteBtn = document.createElement("button");
    deleteBtn.className = "delete-btn";
    deleteBtn.innerHTML = "Delete";
    deleteBtn.onclick = function () {
      deleteTask(index);
    };

    // Create a wrapper for date and delete button
    var rightSection = document.createElement("div");
    rightSection.className = "right-section";
    rightSection.appendChild(dateSpan);
    rightSection.appendChild(deleteBtn);

    // Add elements to list item
    listItem.appendChild(descSpan);
    listItem.appendChild(rightSection);

    taskList.appendChild(listItem);
  });
}

function addTask() {
  var description = document.getElementById("taskInput").value;
  var dueDate = document.getElementById("dueDateInput").value;

  if (description) {
    todoList.push({
      description: description,
      dueDate: dueDate,
    });
    refreshList();
    document.getElementById("taskInput").value = "";
    document.getElementById("dueDateInput").value = "";
  } else {
    alert("Please enter a task description.");
  }
}

document.getElementById("addTaskBtn").addEventListener("click", addTask);

document
  .getElementById("taskInput")
  .addEventListener("keypress", function (event) {
    if (event.key === "Enter") {
      addTask();
    }
  });

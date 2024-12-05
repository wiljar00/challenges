# ################################################################################# #
# Testing...
# # ################################################################################# #

# Task tests
# test_task = Task.new
# test_task.print_task

# test_task.set_description("finish this project")
# test_task.print_task # expect description to be udpated
# test_task.set_description(123) # expect error to raise
# test_task.set_due_date("2024-12-03")
# test_task.print_task # expect due_date to be tomorrow
# test_task.set_due_date(Date.today + 2)
# test_task.print_task # expect due_date to be the day after tomorrow
# test_task.set_due_date(2024-12-03) # expect an error to raise
# 
# test_task.set_status('completed')
# test_task.print_task # expect status to be completed

# ################################################################################# #
# Runing the Todo List app
# ################################################################################# #

require './RubyTodoList/task.rb'
require './RubyTodoList/todo_list.rb'

instance = RubyTodoList::TodoList.new
instance.start_app
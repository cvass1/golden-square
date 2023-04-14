# Tasks Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
class TodoList
  def initialize
    @list = [] # creates an empty array to store tasks
  end

  def add_task(task)
    # adds new task to list
  end

  def display_tasks
    # returns list of tasks
  end

  def mark_complete(task)
    # removes a task from the task list
  end

end


```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1 - returns list of a single task
todo_list = TodoList.new
todo_list.add_task("walk the dog")
todo_list.display_tasks => ["walk the dog"]

# 2 - returns list of multiple tasks
todo_list = TodoList.new
todo_list.add_task("walk the dog")
todo_list.add_task("wash the car")
todo_list.display_tasks => ["walk the dog", "wash the car"]

# 3 - deletes completed tasks from list
todo_list = TodoList.new
todo_list.add_task("walk the dog")
todo_list.add_task("wash the car")
todo_list.mark_complete("walk the dog")
todo_list.display_tasks => [ "wash the car"]

# 4 - displays an empty list if no tasks added
todo_list = TodoList.new
todo_list.display_tasks => []
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


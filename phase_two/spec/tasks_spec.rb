require "tasks"

RSpec.describe TodoList do
  it "returns list of a single task" do
    todo_list = TodoList.new
    todo_list.add_task("walk the dog")
    result = todo_list.display_tasks
    expect(result).to eq ["walk the dog"]

  end

  it "returns list of multiple tasks" do
    todo_list = TodoList.new
    todo_list.add_task("walk the dog")
    todo_list.add_task("wash the car")
    result = todo_list.display_tasks
    expect(result).to eq ["walk the dog", "wash the car"]
  end

  it "deletes completed tasks from list" do
    todo_list = TodoList.new
    todo_list.add_task("walk the dog")
    todo_list.add_task("wash the car")
    todo_list.mark_complete("walk the dog")
    result = todo_list.display_tasks
    expect(result).to eq [ "wash the car"]
    
  end

  it "displays an empty list if no tasks added" do
    todo_list = TodoList.new
    result = todo_list.display_tasks
    expect(result).to eq []
  end
end


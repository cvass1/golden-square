require 'todo'
require 'todo_list'

RSpec.describe 'TodoList intergration' do
  context "when given at least one todo" do
    it 'adds a todo to the todolist' do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_list.add(todo_1)
      result = todo_list.incomplete
      expect(result).to eq [todo_1] 
    end

    it 'adds multiple todo to the todolist' do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_2 = Todo.new("get milk")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      result = todo_list.incomplete
      expect(result).to eq [todo_1, todo_2] 
    end

    it 'adds multiple todo to the todolist but one is complete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_2 = Todo.new("get milk")
      todo_1.mark_done!
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      result = todo_list.incomplete
      expect(result).to eq [todo_2] 
    end

    it 'adds multiple todo to the todolist but one is complete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_2 = Todo.new("get milk")
      todo_1.mark_done!
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      result = todo_list.complete
      expect(result).to eq [todo_1] 
    end

    it 'adds multiple todo to the todolist and all are complete' do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_2 = Todo.new("get milk")
      todo_1.mark_done!
      todo_2.mark_done!
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      result = todo_list.complete
      expect(result).to eq [todo_1, todo_2] 
    end
  end
  
  context "for the #give_up!" do
    it "moves all todos into complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_2 = Todo.new("get milk")
      todo_1.mark_done!
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      result = todo_list.complete
      expect(result).to eq [todo_1, todo_2]
    end

    it "moves all todos into complete" do
      todo_list = TodoList.new
      todo_1 = Todo.new("wash the dog")
      todo_2 = Todo.new("get milk")
      todo_1.mark_done!
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.give_up!
      result = todo_list.incomplete
      expect(result).to eq []
    end
  end
end
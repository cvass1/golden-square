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
  end
end
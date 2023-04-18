require 'todo'

RSpec.describe Todo do
  it 'returns the task name' do
    todo = Todo.new("weekly food shop")
    result = todo.task
    expect(result).to eq "weekly food shop"
  end
end
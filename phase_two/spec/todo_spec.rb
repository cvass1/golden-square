require 'todo'

RSpec.describe Todo do
  it 'returns the task name' do
    todo = Todo.new("weekly food shop")
    result = todo.task
    expect(result).to eq "weekly food shop"
  end

  it 'returns false for #done? if not completed' do
    todo = Todo.new("weekly food shop")
    result = todo.done?
    expect(result).to eq false
  end

  it 'returns true for #done? if completed' do
    todo = Todo.new("weekly food shop")
    todo.mark_done!
    result = todo.done?
    expect(result).to eq true
  end
end
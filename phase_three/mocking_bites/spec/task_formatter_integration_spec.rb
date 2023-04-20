require 'task_formatter'
require 'task'

RSpec.describe 'TaskFormatter integration' do
  it "returns an uncompleted task formatted as a string" do
    task = Task.new("Title 1")
    task_formatter = TaskFormatter.new(task)
    result = task_formatter.format
    expect(result).to eq "- [ ] Title 1"
  end

  it "returns an completed task formatted as a string" do
    task = Task.new("Title 2")
    task.mark_complete
    task_formatter = TaskFormatter.new(task)
    result = task_formatter.format
    expect(result).to eq "- [x] Title 2"
  end

end
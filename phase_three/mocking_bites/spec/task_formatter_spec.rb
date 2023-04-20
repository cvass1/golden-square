require 'task_formatter'

RSpec.describe TaskFormatter do
  it "returns an uncompleted task formatted as a string" do
    task = double(:fake_task, complete?: false, title: "Fake Title 1")
    task_formatter = TaskFormatter.new(task)
    result = task_formatter.format
    expect(result).to eq "- [ ] Fake Title 1"
  end

  it "returns an completed task formatted as a string" do
    task = double(:fake_task, complete?: true, title: "Fake Title 2")
    task_formatter = TaskFormatter.new(task)
    result = task_formatter.format
    expect(result).to eq "- [x] Fake Title 2"
  end

end
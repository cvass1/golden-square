class Todo
  def initialize(task) # task is a string
    @todo = {name: task, complete: false}

  end

  def task
    @todo[:name]
  end

  def mark_done!
    @todo[:complete] = true
  end

  def done?
    @todo[:complete]
  end
end
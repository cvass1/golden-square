class TodoList
  def initialize
    @list = [] # creates an empty array to store tasks
  end

  def add_task(task)
    @list << task
  end

  def display_tasks
    @list
  end

  def mark_complete(task)
    @list.delete(task)
  end
end
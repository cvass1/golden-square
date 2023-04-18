class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todo_list.push(todo)
  end

  def incomplete
    @todo_list.select { |todo| !todo.done? }
  end

  def complete
    @todo_list.select { |todo| todo.done? }
  end

  def give_up!
    # Marks all todos as complete
    fail "no items added" if @todo_list == []
    @todo_list.each do |todo|
      todo.mark_done!
    end
  end
end

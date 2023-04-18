require 'todo_list'

RSpec.describe TodoList do
  context "when no todo is added" do
    it 'return an empty array for #incomplete' do
      todo_list = TodoList.new
      result = todo_list.incomplete
      expect(result).to eq []
    end

    it 'return an empty array for #complete' do
      todo_list = TodoList.new
      result = todo_list.complete
      expect(result).to eq []
    end

    it 'returns an error for #give_up!' do
      todo_list = TodoList.new
      expect {todo_list.give_up!}.to raise_error "no items added"
    end
  end
end
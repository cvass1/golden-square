require 'todo_checker'

RSpec.describe 'todo_checker' do
  context 'handles empty strings' do
    it 'returns false' do
      expect(todo_checker('')).to eq false
    end 
  end

  context 'returns true when a task is present' do
    it 'returns true when "#TODO" in the text' do
      result = todo_checker("#TODO Wash dishes")
      expect(result).to eq true
    end
  end

  context 'returns false when no task found' do
    it 'returns false when not found phrase' do
      expect(todo_checker("Walk the dog")).to eq false
    end

    it 'returns false when part of phrase missing' do
      expect(todo_checker("TODO go to the shops")).to eq false
    end
  end
end
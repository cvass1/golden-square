# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary
As a user
So that I can reflect on my experiences
I want to read my past diary entries
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed
As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────────────────────────────┐
│ Diary                                              │
│                                                    │
│ - add(diary_entry)                                 │
│ - all                                              │
│ - return_diary_entry_contents (diary_entry)        │
│   => ["my contents"]                               │
| -find_best_entry_for_reading_time(wpm, minutes)   |
| - return_contacts_list                             |
| => ["07768846573", "07465968777"]                  |
└───────────┬────────────────────────────────────────┘
            └────────────────────────────────────────────────────┐
            │ owns a list of
            ▼
┌─────────────────────────┐
│ DiaryEntry('my_title', 'my_contents')    │
│                         │
│ - title                 │
│ - contents                │
│ - count_words                │
│   => #returns an integer  │
└─────────────────────────┘

┌────────────────────────────────────────────────────┐
│ TodoList                                           │
│                                                    │
│ - add(todo)                                        │
│ - all                                              │
│   => [todo_1, todo_2]                              │               
└───────────┬────────────────────────────────────────┘
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Todo(task)              │
│                         │
│ - task                  │
└─────────────────────────┘




```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  end

  def add(diary_entry)
  # adds from the instance of diary_entry
  # returns nothing
  end

  def return_diary_entry_contents(diary_entry)
  # returns the contents from a given diary_entry instance
  end
  
  def find_best_entry_for_reading_time(wpm, minutes)
  # returns the diary_entry instance with the most appropriate reading time
  end

  def return_contacts_list
  # searches all diary_entry contents for phone numbers
  # returns a list of phone numbers
  end
end

class DiaryEntry
  def initialize("my_title", "my_contents")
  end

  def title
    #returns the title
  end

  def contents
    #returns the contents
  end

  def count_words
    # counts the number of words in the contents
    # returns an integer
  end
end

class TodoList                                        
  def initialize
  end

  def add(todo)
    # adds an instance of todo to a list
    # returns nothing
  end

  def all
    # returns the list of todos
  end
end 

class Todo
  def initialize(task)
  end

  def task
    # displays the task
  end

end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


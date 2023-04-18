class Diary
  def initialize
    @entries = []
    @contacts = []
  end

  def add(diary_entry)
  # adds from the instance of diary_entry
  # returns nothing
  @entries.push(diary_entry)
  end

  def return_diary_entry_contents(diary_entry)
  # returns the contents from a given diary_entry instance
  diary_entry.contents
  end
  
  def find_best_entry_for_reading_time(wpm, minutes)
  # returns the diary_entry instance with the most appropriate reading time
  fail "No entries added" if @entries == [] 
  entry_word_counts = {}
  max_words = wpm * minutes

  @entries.each{ |entry| entry_word_counts[entry] = entry.count_words }

  result_pair = entry_word_counts.select{|k,v| v < max_words}.max_by{|k,v| v }

  return result_pair == nil ? nil : result_pair[0]


    
  end
  def return_contacts_list
    # searches all diary_entry contents for phone numbers
    # returns a list of phone numbers
    @entries.each { |entry|
      phone_number =  entry.contents.gsub(/[^0-9]/, '')
      if phone_number.length == 11 then
        @contacts.push(phone_number)
      end 
      }
    @contacts


    end
  end

# Reading Time Method Design Recipe

## 1. Describe the Problem

As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# 'time_to_read' returns a time in minutes (rounded to 1dp) to read a given text assuming a reading rate of 200 words per minute
reading_time = time_to_read(text)

reading_time: a string (eg "0.5 minutes")
text: a string (eg "this is a book")

# The method doesn't print anything or have any other side-effects

```




## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

time_to_read("this book") => "0.0 minutes"
time_to_read("") => "0.0 minutes"
time_to_read(TWO_HUNDRED_WORDS) => "1.0 minute"
time_to_read(ONE_HUNDRED_WORDS) => "0.5 minutes"
time_to_read(FOUR_HUNDRED_AND_FIFTEEN_WORDS) => "2.1 minutes"


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


# Improve Grammar Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby

# 'correct_grammar' checks if the given text starts with a capital letter and ends with a punctuation mark
correct_grammar =  check_grammar(text)

text: a string (e.g. "Hello, world!")
correct_grammar: boolean (e.g. true)


# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby

correct_grammar("Hello, world!") => true
correct_grammar("Hello world.") => true
correct_grammar("Hello, world") => false
correct_grammar("hello, world!") => false
correct_grammar("hello world") => false
correct_grammar("") => false


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


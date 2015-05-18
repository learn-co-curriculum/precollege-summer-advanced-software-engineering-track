## Ruby Review - Full Lecture

### SWBATS

### Motivation

In Intro to Software Engineering, you guys built full MVC web applications and became masters of Ruby. Even masters need practice, though, so let's go over some of the Ruby Basics before diving into the rest of the course!


### Lesson Plan

#### Data Types

+ Let's start by reviewing some of the different data types in Ruby. Who remembers some of the different types of data we can store? *Teacher - have students give their own example of each data type* 
	* Strings - "Flatiron School is great!"
	* Integers - 42
	* Floats - 42.57
	* Boolean - true
+ Nice. Let's do a quick quiz. I'll put some data on the board, and you tell me the type. 
	* `34` - integer
	* `"No garden of one dragon"` - string
	* `"34"` - string
	* `true` - boolean
	* `"false"` - string
	* `false` - boolean

#### Methods

+ Remember that different data types have different methods that we can use on them. What are some methods we can use on strings? 
	* `.reverse`
	* `.upcase`
	* `.downcase`
+ How about on integers?
	* `.to_s`
	* `.even?`
	* `.odd?`
+ What's a method that we can use to print something to our screen?
	* `puts`
+ And get content from a user?
	* `gets`
+ What about if we want to define our own method? How can we do that?

```ruby
def say_hi
	puts "Hi!!"
end
```

+ So, let's write a program that greets asks a user what their name is and gives them a personalized greeting. So the first thing we need to do is ask their name. How do I do that?
	* `puts "What's your name?"`
+ Great. Now I want to take in their name and store it as a variable. Who can help me do that?
	* `name = gets.chomp`
	* remember the `.chomp` to chomp off the enter key
+ Now, let's say their name back to them. How can we do this?
	* One way: `puts "Hello, " + name`
	* Another way: `puts "Hello, #{name}"`

#### Conditionals

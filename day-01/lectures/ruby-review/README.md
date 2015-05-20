#DAY-01 Ruby Review

_A full lecture is available [here](LECTURE.md)_

## SWBATS

+ Recall basic Ruby syntax
+ Assign a variable to different data types
+ Call built-in Ruby methods and define their own methods
+ Understand and use arrays and hashes to organize data
+ Use methods to iterate through and manipulate data structures
+ Create classes and use attr_accessors to access data

## Motivation

In Intro to Software Engineering, you built full MVC web applications and became masters of Ruby. Even masters need practice, though, so let's go over some of the Ruby Basics before diving into the rest of the course!

## Lesson Plan

### Data Types

+ Here are some different types of data we use in Ruby
	* Strings - `"Flatiron School is great!"`
	* Integers - `42`
	* Floats - `42.57`
	* Boolean - `true`

### Methods

+ List out some of the different built in Ruby methods we can use. 
+ We can also define our own methods
+ Walk through building out a program that takes in a user's name and says hello to them. 

#### Conditionals

+ Review using conditionals to affect what happens when our program runs

#### Arrays and Hashes

+ We use arrays and hashes to store and organize our data
	* `my_array = ["Sandwich", 2, "Hello", 23.23]`
+ How do we access elements out of the array? 
	* `my_array[index]` - remember that we start counting from zero
	* `my_array[0]` gives the first element, in this case "Sandwich"
+ What are some methods that we can call on arrays?

+ What about hashes, how are they different than arrays?
	* Arrays are like ordered lists, hashes are stored by key-value pairs
	* `my_hash = {key => value}`
	* Another example: `birthday_tracker = {"Luke" => "May", "Leia" => "May", "Han" => "December"}`
+ We can access these values by the key
	* `my_hash["Luke"]` would return `"May"`
+ What are some hash methods? 


##### Iterating through Arrays and Hashes

+ We mentioned the `.each` method earlier. This lets us go through an array or hash and perform an action on each item in it. 
	
##### Nested Structures

+ Arrays and hashes can store other arrays and hashes. This can be really useful for keeping our data organized.
```ruby
stuff_in_my_house = {"food"=>["lettuce", "cereal", "popcorn"], "furniture" =>["sofa", "bed", "chair"], "electronics" => ["TV", "Laptop", "PlayStation"]}
```

#### Object Orientation
+ Imagine if Facebook used hashes to represent all of their users. 
+ It would be really tricky to keep track of things like friends and interests in common. Instead, we create a User template and then create instances of the user. 
+ We can store our properties by setting up attr_accessors


### Conclusion/So What?

+ Ruby is the founation of everything we've done up until this point. In this course, you're going to learn how to really leverage Object Oreintation to make fully featured web applications. 

### Hints and Hurdles
+ Feel free to go through this quickly if the students are picking it up, especially the data type/variable assignment sections. 



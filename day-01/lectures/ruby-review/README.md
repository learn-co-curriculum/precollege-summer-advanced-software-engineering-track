#DAY-01 Ruby Review

_A full lecture is available [here](LECTURE.md)_

## SWBATs

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
+ We can store our attributes in instance variables and access them by setting up attr_accessors
+ attr_accessors give us "getter" and "setter" methods for each instance variable. 

#### Self

+ Each new instance of a user will get a different name, email, password, and array of friends. What if we wanted a variable to keep track of all of the users that have been created? 
+ We can use a class constant - a variable which will belong to the entire class of User. In Ruby, we specify this by using ALL_CAPS
+ Notice that every time we a new user is initialized, we want to add that user into our ALL_USERS array. 
+ But how do we access the `ALL_USERS` variable from outside of our class? How can we ask the User class how many users have been created? 
+ For this, we need a class method. Class methods are called on the class instead of instances of the class. For example, we'd like to say `User.all` and have that return our `ALL_USERS` constant. We define class variables using Ruby's keyword `self`. 
+ In a nutshell, `self` is a placeholder meaning "the current scope". Inside of the class, it refers to the class itself. Inside of other methods, it refers to the instance of the class. 


### Conclusion/So What?

+ Ruby is the founation of everything we've done up until this point. In this course, you're going to learn how to really leverage Object Oreintation to make fully featured web applications. 

### Hints and Hurdles
+ Feel free to go through the beginning very quickly if the students are picking it up
+ The concept of `self` can be confusing - let kids know that it's okay if it takes awhile for them to pick it up. You'll have more time to practice during the Fwitter lecture in the afternoon. 



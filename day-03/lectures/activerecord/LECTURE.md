#Databases - Full Lecture


##Objective

***Add a database to a Sinatra application in order to persist data***

## SWBATs

+ SINATRA - Connect a Sinatra app to a DB
+ RAKE - Complete tasks using Rake (list tasks via Rake -T)
+ ACTIVE RECORD/RAKE - Understand why we use migrations
+ FORMS -  Build up and down migrations with proper syntax
+ MODEL - Understand that ActiveRecord works with models to execute SQL commands.
+ ACTIVE RECORD - Use Active Record to access data from a database

## Motivation / Why Should You Care?

We've learned about how essential databases are for our web applications. How do we actually connect our web application to our database? Today, we'll do that with ActiveRecord. 

## Lesson Plan

***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-3-code-snippets)***

***Sample completed project for today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-software-engineering-fwitter-project/tree/day03-databases)***

**Abstraction** 
NOTE: ActiveRecord is very abstract. We've found that framing this lecture around abstraction helped students grasp that we're just removing details from our program, not fundamentally changing how it works. 

Prompt the students with a question: What is abstraction? What does abstraction make them think of? (Art, Music, etc.)

Put an image of Picasso's Bull on the board ![](http://www.hover.com/wp-content/uploads/2014/08/Picasso.jpg)

Here, Picasso started with a very detailed image of a bull. He then wanted to see - how much detail could be removed and still have the essence of the bull remain? Here, he's managed complexity - he's able to convey a bull with a very simple outline. 

"To arrive at abstraction, it is always necessary to begin with concrete reality... You must always start with something. Afterward you can remove all traces of reality. There's no danger then, anyway, because the idea of the object will have left an indelible mark. " - Picasso

Have the students discuss in groups: how does abstraction relate to technology? 

A few potential examples:
  + The GUI, or graphical user interface, is an abstraction for terminal commands
  + The Ruby Programming language is written in C, which is compiled into binary.
  + attr_accessor is an abstraction for getter and setter methods. 

We're about to make our programs more abstract, but remember that there's no danger. 

**ACTIVE RECORD**
***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-3-code-snippets)***

+ SQL can be hard to write, especially when you're trying to pull information from multiple tables.
+ ActiveRecord is gem that sets up a SQL database and lets us write ruby code to read and write to the database
+ Gemfile: add 'activerecord' and 'sinatra-activerecord' and 'sqlite3' and 'rake' gems to your gemfile
+ See Code Snippet 1
+ Rake is a way to get your program to run specific tasks that you or other developers have defined. For example, building a table can be easily done using the rake gem. 
+ Run `bundle install` in terminal after you save changes
+ Create a `Rakefile`.
+ See code snippet 2 for code for this file
+ This file will hold any customized instructions that we might want to write for modifying our database
+ Check available tasks. In terminal enter `rake -T`.
+ The first tasks you’ll see are `db:create` and `db:create_migration`
+ A migration is set of instructions in ruby that build and change your sql database. 
+ We use these timestamped instructions so that databases can be created and modified from anywhere by anyone
+ Create migration to create tweets table: in terminal enter `rake db:create_migration NAME=create_tweets`
+ This creates a db directory added to your project and inside that directory, a migrate directory. 
+ In the migrate directory you’ll see a new file that is named with a timestamp (the time it was created) and the name of the migration you created. This is the migration we’ll be running. Open it up.
+ It will have a class built with a descriptive name
+ delete the `change` method
+ create two methods `up` and `down`
+ See code snippet 3
  + Inside `up` - creating table called tweets with two columns (user and status)
  + `down` let's us delete that table.
+ Edit `environment.rb` - see code snippet 4
+ Edit Rakefale - see code snippet 5
+ To run the migration, and create the tale, in terminal enter `rake db:migrate`
+ Creates a `schema` file in the db directory
+ Make sure students git add, commit, push at this point
+ Modify the models to inherit from `ActiveRecord::Base` and delete all the reader/writer methods
+ See code snippet 6
+ having the tweets class inherit from ActiveRecord gives us all the reader and writer methods we need, and automatically saves them to the database.
+ Naming conventions (SUPER important)
+ `Tweet` class (singular and capitalized)
+ `Tweets` table (plural)
+ `CreateTweets` (camel case) in the migration
+ Creating tweets: in terminal, enter `tux` - opens up a console sort of like IRB to play around and create instances of our tweet class.
+ `d = Tweet.new(:user => “Danny”, :status => “hello world!”)`
  + ActiveRecord uses hash-like syntax - the attribute is the key and the data is the value
  + running that returns `nil`, because we haven't saved the instance yet
  + `d.save` will save to the database and create a new row in the Tweet table and automatically assign it an ID.
+ Pull info from the database:
  + `Tweet.find_by_sql("select * from tweets")`
  + ActiveRecord makes it even easier, we don't need to use any SQL 
    + `Tweet.all` - gives all tweets
    + `Tweet.first` - first tweet (oldest)
    + `Tweet.last` - last tweet (most recent)
    + `Tweet.where(:user => "Danny")` - all tweets where the username has the string "Danny" in it - returns lots of records
    + `Tweet.find(2)` - to find a tweet with the ID 2. errors if it doesn't find anything
    + `Tweet.find_by(:username => "Danny")` - limits one result, will only return an exact match with case sensitivity.

+ Connecting to The Controller
+ We don't need to change the forms, just the actions inside the POST request to `/tweets`
  + See code snippet 7


## Conclusion / So What?

Databases are extremely powerful tools that allow for applications to store information. Without them, you could never email your friends from Gmail, post cat memes to Facebook, check out your friends on Instagram, and watch funny videos on Tumblr.



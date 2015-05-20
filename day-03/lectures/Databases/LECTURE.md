##Objective
***Add a database to a Sinatra application in order to persist data***

## SWABTS

+ DATABASES - Explain why databases are important 
+ DATABASES - Describe the structure of a database
+ SQL - Create and modify tables and access info from tables via SQL queries
+ SINATRA - Connect a Sinatra app to a DB
+ RAKE - Complete tasks using Rake (list tasks via Rake -T)
+ ACTIVE RECORD/RAKE - Understand why we use migrations
+ FORMS -  Build up and down migrations with proper syntax
+ MODEL - Understand that ActiveRecord works with models to execute SQL commands.
+ ACTIVE RECORD - Use Active Record to access data from a database

## Motivation / Why Should You Care?
The way that we use the internet would be vastly different if we couldn’t save our data. You wouldn’t be able to have sites like facebook, tumblr, yelp or pretty much anything. Databases make all of these applications possible. They are the backbone of the web. We’re going to learn how to persist (save) data so that it is accessible from different places at different times.

## Lesson Plan
**BEFORE CLASS: DOWNLOAD MYSQL** You can find the guide for downloading and using MYSQL [here](https://github.com/learn-co-curriculum/hs-ruby2-teachers-guide-mysql-setup)

***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-3-code-snippets)***

***Sample completed project for today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-3)


+ **WHAT IS A DATABASE**
  * A relational database is essentially a series of tables that can be joined to one another.Each table is like an excel spreadsheet.
  *  A school may have a database with two tables one for students and another for grades. To link these two files, each student is assigned a unique identification number, which appears in both the personal information file and the grades file.

+ **SQL**
  * SQL is the language that controls databases (how you create and name tables, add information, add, delete, modify, and read information)
  * **Class should download [MySQL Workbench](http://dev.mysql.com/downloads/workbench/)**
    * Open up Workbench, and click the `+` next to `MySQL Connections`
      * The Hostname is the teacher's IP address
      * Username should be `flatiron` 
      * Password is `learnlovecode`
      * Click 'ok' to connect
    * Schema is in bottom left corner - students should see `flatiron_class`
      * Double click on `flatiron_class` they want to work from to run commands
    * Enter SQL commands in the big white box
    * Hit the lighting bolt to run the command

  * Creating a table:
    * Students do this and create their own table names
    * Example for tweets:
  ```sql
    CREATE TABLE tweets (id integer auto_increment primary key, user VARCHAR(50), status VARCHAR(140)); 
  ```
    * `CREATE TABLE tweets`: We're actually creating the table in our databse called tweets
    * ` id integer auto_increment primary key`: Here we're creating the ID column, and the datatype of the information that will be stored in this table is an integer. `primary key` means it's a unique identifier for each row, and `auto_increment` means that for every new entry in the database, the ID will automatically increase by 1. 
    * `user VARCHAR(50)`: creating the user column with a string datatype. This can only hold 50 characters
    * `status VARCHAR(140)`: creating the status column which holds a string of 140 characters. VARCHAR stands for variable character.
  
  * Adding a row (adding data):
  ```sql
    INSERT INTO tweets (user, status) VALUES (“Danny”, “Hello world!”);
  ```
    * The ID column would get populated with 1 (happens automatically)
    * user column gets population with "Danny"
    * status column gets population with "Hello world!"

  * Read information:
  ```sql
    SELECT * FROM tweets 
  ```
    * `*` means we're selecting everything
    * `FROM tweets` means from the tweets table
  * have students enter their own information in the database in a table called `students`
  * `select * from students` pulls all students
  * `select * from students where name="zach"` gives us one record if there is a match
  * `SELECT * FROM sunday_students WHERE favorite_food = "pizza"` gives all info about all students that like pizza
  * ``SELECT name FROM sunday_students WHERE favorite_food = "pizza"` gives us the names of the students who's fav food is pizza
  * SQL Challenges on board: https://github.com/learn-co-curriculum/hs-sql-queries-challenge 

+ **ACTIVE RECORD**
  ***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-3-code-snippets)***
  
  * SQL can be hard to write, especially when you're trying to pulll information from multiple tables.
  * ActiveRecord is gem that sets up a SQL databse and lets us write ruby code to read and write to the database
  * Gemfile: add 'activerecord' and 'sinatra-activerecord' and 'sqlite3' and 'rake' gems to your gemfile
    * See Code Snippet 1
    * Rake is Rake is a way to get your program to run specific tasks that you or other developers have defined. For example, building a table can be easily done using the rake gem. 
    * Run `bundle install` in terminal after you save changes
  * Create a `Rakefile`.
    * See code snippet 2 for code for this file
    * This file will hold any customized instructions that we might want to write for modifying our database
  * Check available tasks. In terminal enter `rake -T`.
  * The first tasks you’ll see are `db:create` and `db:create_migration`
    * A migration is set of instructions in ruby that build and change your sql database. 
    * We use these timestamped instructions so that databases can be created and modified from anywhere by anyone
  * Create migration to create tweets table: in terminal enter `rake db:create_migration NAME=create_tweets`
    * This creates a db directory added to your project and inside that directory, a migrate directory. 
    * In the migrate direcory you’ll see a new file that is named with a timestamp (the time it was created) and the name of the migration you created. This is the migration we’ll be running. Open it up.
    * It will have a class built with a descriptive name
    * delete the `change` method
    * create two methods `up` and `down`
    * See code snippet 3
      * Inside `up` - creating table called tweets with two columns (user and status)
      * `down` let's us delete that table.
  * Edit `environment.rb` - see code snippet 4
  * Edit Rakefale - see code snippet 5
  * To run the migration, and create the tale, in terminal enter `rake db:migrate`
    * Creates a `schema` file in the db directory
    * Make sure students git add, commit, push at this point
  * Modify the models to inherit from `ActiveRecord::Base` and delete all the reader/writer methods
    * See code snippet 6
    * having the tweets class inherit from ActiveRecord gives us all the reader and writer methods we need, and automatically saves them to the database.
  * Naming conventions (SUPER important)
    * `Tweet` class (singular and capitalized)
    * `Tweets` table (plural)
    * `CreateTweets` (camel case) in the migration
  * Creating tweets: in terminal, enter `tux` - opens up a console sort of like IRB to play around and create instances of our tweet class.
    * `d = Tweet.new(:user => “Danny”, :status => “hello world!”)`
      * ActiveRecord uses hash-like syntax - the attribute is the key and the data is the value
      * running that returns `nil`, because we haven't saved the instance yet
      * `d.save` will save to the database and create a new row in the Tweet table and automatically assign it an ID.
    * Pull info from the database:
      * `Tweet.find_by_sql("select * from tweets")`
      * ActiveRecord makes it even easier, we don't need to use any SQL 
        * `Tweet.all` - gives all tweets
        * `Tweet.first` - first tweet (oldest)
        * `Tweet.last` - last tweet (most recent)
        * `Tweet.where(:user => "Danny")` - all tweets where the username has the string "Danny" in it - returns lots of records
        * `Tweet.find(2)` - to find a tweet with the ID 2. errors if it doesn't find anything
        * `Tweet.find_by(:username => "Danny")` - limits one result, will only return an exact match with case sensitivity.

  * Connecting to The Controller
    * We don't need to change the forms, just the actions inside the POST request to `/tweets`
      * See code snippet 7


## Conclusion / So What?
Databases are extremely powerful tools that allow for applications to store information. Without them, you could never email your friends from Gmail, post cat memes to Facebook, check out your friends on Instagram, and watch funny videos on Tumblr.


## Hints and Hurdles
+ MySQL workbench works on all computers (PC, Mac, Chromebook)
+ Make sure they understand how SQL works and test the DB before class

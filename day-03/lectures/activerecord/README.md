#DAY-03 ActiveRecord 

_A full lecture is available [here](LECTURE.md)_

###SWBATs
***Add a database to a Sinatra application in order to persist data***

### Motivation / Why Should You Care?
The way that we use the internet would be vastly different if we couldn’t save our data. You wouldn’t be able to have sites like facebook, tumblr, yelp or pretty much anything. Databases make all of these applications possible. They are the backbone of the web. We’re going to learn how to persist (save) data so that it is accessible from different places at different times.

### Lesson Plan

+ ** Abstraction **

Prompt the students: What is Abstraction? How does abstraction relate to technology? 

***Note: this will be helpful as you remove detail from your code. ***

***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-3-code-snippets)***

***Sample completed project for today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-software-engineering-fwitter-project/tree/day03-databases)***


+ **ACTIVE RECORD:** is gem that sets up a SQL databse and lets us write ruby code to read and write to the database

***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-3-code-snippets)***
  * Create a table. In terminal enter: `rake db:create_migration NAME=create_tweets`
    * This creates a db directory added to your project and inside that directory, a migrate directory. 
    * In the migrate direcory you’ll see a new file that is named with a timestamp (the time it was created) and the name of the migration you created. This is the migration we’ll be running to create the table
    ```ruby
     def up
      create_table :tweets do |t|
        t.string :user
        t.string :status
      end
    end
    
    def down
      drop_table :tweets
    end
    ```

+ Creating tweets: in terminal, enter `tux` - opens up a console sort of like IRB to play around and create instances of our tweet class.
    * `d = Tweet.new(:user => “Danny”, :status => “hello world!”)`
    * `Tweet.all` - gives all tweets
    * `Tweet.first` - first tweet (oldest)
    * `Tweet.last` - last tweet (most recent)
    * `Tweet.where(:user => "Danny")` - all tweets where the username has the string "Danny" in it - returns lots of records
    * `Tweet.find(2)` - to find a tweet with the ID 2. errors if it doesn't find anything
    * `Tweet.find_by(:username => "Danny")` - limits one result, will only return an exact match with case sensitivity.

### Conclusion / So What?
Databases are extremely powerful tools that allow for applications to store information. Without them, you could never email your friends from Gmail, post cat memes to Facebook, check out your friends on Instagram, and watch funny videos on Tumblr.


### Hints and Hurdles
+ MySQL workbench works on all computers (PC, Mac, Chromebook)
+ Make sure they understand how SQL works and test the DB before class

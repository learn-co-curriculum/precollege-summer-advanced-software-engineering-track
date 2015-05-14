# Intro to ActiveRecord Relationships - Lecture Notes

## Objective

Build out a database in a Sinatra project with multiple tables that each connect to a different model.

## SWBATS

***Students will be able to use Active Record associations to create a belongs_to and has_many relationship

## Motivation / Why Should You Care?

Last week we did a ton of work with ActiveRecord to get our databases hooked up to our apps. Our twitter database is pretty simple though - we just have one tweets table with users and their statuses. But what if we were keeping track of tweets and followers and trending hashtags and direct messages? We would need a much more complex database with separate tables and models for tweets, users, hashtags and direct messages. Getting all of these tables hooked up to each other and making all of these models play nice is super important and that is where we see the magic of ActiveRecord.

### Lesson Plan
***BEFORE CLASS: Check out and be familiar with the code snippets [here](https://github.com/learn-co-curriculum/hs-week-4-code-snippets/)***
*** Completed Fwitter project for today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-4)
** We'll be implementing a belongs_to and has_many relationship between a User and a Tweet

+ Why do we want separate tables and models?
  * Because different models have different attributes and responsibilities.
  * Breaking up the functionality of an app into smaller pieces makes it easier to scale up and debug applications.
  * It makes it easier to have multiple developers working on different features at the same time
  * It removes the duplication of data - Your user is defined once and then referenced in every tweet that they write.

+ Let's start by making a new user model. 
  * `rake db:create_migration NAME="create_users"`
    * In the new migration file, create `up` and `down` methods.
    * see [code snippet 1](./code-snippets.md)
    * In terminal: run `rake db:migrate` to create the table
  * Now, let's create our Users model that maps to that table
    * Create a new file, `user.rb`,  in `app/models`
    * In that file, create a User class that inherits from ActiveRecord::Base
  * Test if you User model and tables are working properly
    * Go into tux and create at least one user
+ Adding the V and C to our MVC
  * Challenge the students to create a new `user.erb` view and a route in their controller to display that template
+ Associate our Tweets with our Users
  * A tweet `belongs_to` one user, and a user `has_many` tweets 
  * See [code snippet 2](./code-snippets.md)
+ Add user_id column to our Tweets
  * Our 'tweets' table needs to keep track of `user_id` instead of `user` for Active Record to do it's magic
  * Create a change migration. In terminal enter: `rake db:create_migration NAME="modify_tweets"`.
  * In migration (in db directory) create `up` and `down` methods.
  * see [code snippet 3](./code-snippets.md)
  * In terminal: `rake db:migrate` to create the table
  * Go into tux and do Tweet.destroy_all to destroy all of the tweets that are currently in the database - they are no longer valid
+ Modifying the Tweets form
  * Have students update their forms to accept `user_id` instead of user
  * Create a tweet for user 1
  * Taking in user IDs is not the best way to set up a tweet because users don't always know their ID and if they input the wrong ID our application will error out
    * A much better solution is to create a list of current users that people can choose from
    * We can pull a list of users with `User.all` and create a drop down menu with that list
    * See [code snippet 4](code-snippets.md)

### Conclusion / So What?
* You guys now have the basic building blocks for setting up databases and applications just like the pros!


### Hints and Hurdles
* You may need to save the dropdown menu portion of modifying the form for the next class - there is a lot going on in this class
* Emphasize MVC and the need to and modify each portion of the MVC when making updates to the application
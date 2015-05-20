#DAY-04 Intro to ActiveRecord Relationships

_A full lecture is available [here](LECTURE.md)_

## Objective

Build out a database in a Sinatra project with multiple tables that each connect to a different model.

## Motivation / Why Should You Care?

Yesterday we did a ton of work with ActiveRecord to get our databases hooked up to our apps. Our twitter database is pretty simple though - we just have one tweets table with users and their statuses. But what if we were keeping track of tweets and followers and trending hashtags and direct messages? We would need a much more complex database with separate tables and models for tweets, users, hashtags and direct messages. Getting all of these tables hooked up to each other and making all of these models play nice is super important and that is where we see the magic of ActiveRecord.

## Lesson Plan

***Code snippets can be found [here](./code-snippets.md)***

*** Completed Fwitter project for today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-4)

+ Why do we want separate tables and models: (tweet model, user model, hashtag model)? Why not have one model called "thing" that can represent everything? 
  * Because different models have different attributes and responsibilities.
  * Breaking up the functionality of an app into smaller pieces makes it easier to scale up and debug applications.

+ *New user model:* 
  * Users table in our database. In terminal enter: `rake db:create_migration NAME="create_users"`
    * see [code snippet 1](./code-snippets.md)
    * In terminal: run `rake db:migrate` to run the migration
  * Now, let's create our Users model that maps to that table
    * Create a new file, `user.rb`,  in `app/models`
    * In that file, create a User class that inherits from ActiveRecord::Base
    * See Code Snippet 1
+ Adding the V and C to our MVC
  * Challenge the students to create a new `user.erb` view and a route in their controller to their users
  * Add a form in `users.rb` for users to sign up for an account (essentially a ‘create users’ form - it will be similar to the create tweets form - follow the pattern!). You will need a post route in the `application_controller`
    * See Code Snippet 2

+ Connecting Tweets to Users
  * ActiveRecord makes it easy for us to build relationships between models with two methods called `belongs_to` and `has_many`
  * A user has many tweets, a tweet belongs to a user
    * `user1.tweets` to get an array with all of a user's tweets
    * `tweet1.user` to see who created tweet1
    * See [code snippet 3](./code-snippets.md)
  * Add a `user_id` column to the tweets table
    * Create a change migration. In terminal enter: `rake db:create_migration NAME="modify_tweets"`.
    * see [code snippet 4](./code-snippets.md)
    * In terminal: `rake db:migrate` to create the table
  * Go into tux and do Tweet.destroy_all to destroy all of the tweets that are currently in the database
+ *Modifying the Tweets form:*
  * modify form to take in user's id instead of name (id is how tweets are linked to a user)
  * A user doesn't usually know the ID assigned to them in the database
    * We can pull a list of users with `User.all` and create a drop down menu with that list
    * See [code snippet 5](code-snippets.md)

### Conclusion / So What?
* You guys now have the basic building blocks for setting up databases and applications just like the pros!


### Hints and Hurdles
* You may need to save the dropdown menu portion of modifying the form for the next class - there is a lot going on in this class
* Emphasize MVC and the need to and modify each portion of the MVC when making updates to the application
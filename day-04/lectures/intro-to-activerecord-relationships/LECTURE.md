# Intro to ActiveRecord Relationships - Full Lecture

## Objective

Build out a database in a Sinatra project with multiple tables that each connect to a different model.

## SWBATs

### MVC

+ Build model, view and controller for an additional model (Users)

### ActiveRecord

+ Set up has_many/belongs_to relationships
+ Understand how has_many/belongs_to works via a `user_id` column (or similar equivalent for other models)
+ Build up and down migrations to both create and modify tables

### Forms

+ Build forms for something like tweets that connect a tweet object to the user it belongs to
+ Build a sign up form for new users
+ Layout.erb

### MVC

+ Create a sign up POST controller that works with the sign up form to create new users
+ Create a `layout.erb` template and understand how the Ruby keyword `yield` is used within `layout.erb` to render partials
+ Advanced Students - start thinking about how to create another model to track user's followers or start using ActiveRecord validations?

## Motivation / Why Should You Care?

Yesterday we did a ton of work with ActiveRecord to get our databases hooked up to our apps. Our twitter database is pretty simple though - we just have one tweets table with users and their statuses. But what if we were keeping track of tweets and followers and trending hashtags and direct messages? We would need a much more complex database with separate tables and models for tweets, users, hashtags and direct messages. Getting all of these tables hooked up to each other and making all of these models play nice is super important and that is where we see the magic of ActiveRecord.

## Lesson Plan

***Code snippets can be found [here](./code-snippets.md)***

*** Completed Fwitter project for today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-software-engineering-fwitter-project/tree/day04-activerecord-relationships) ***

+ Why do we want separate tables and models: (tweet model, user model, hashtag model)? Why not have one model called "thing" that can represent everything? 
  * Because different models have different attributes and responsibilities.
  * Breaking up the functionality of an app into smaller pieces makes it easier to scale up and debug applications.
  * It makes it easier to have multiple developers working on different features at the same time
  * It removes the duplication of data - Your user is defined once and then referenced in every tweet that they write.

+ Let's start by making a new user model. 
  * First, we need a new table in our database. In terminal enter: `rake db:create_migration NAME="create_users"`. This will create a new migration file in our `/db` directory
    * In the new migration file, create `up` and `down` methods.
    * see [code snippet 1](./code-snippets.md)
    * In terminal: run `rake db:migrate` to create the table
  * Now, let's create our Users model that maps to that table
    * Create a new file, `user.rb`,  in `app/models`
    * In that file, create a User class that inherits from ActiveRecord::Base
    * See Code Snippet 1
  * Test if you User model and tables are working properly
    * Go into tux and create at least one user
+ Adding the V and C to our MVC
  * Challenge the students to create a new `user.erb` view and a route in their controller to display that template
  * It's really annoying to have to add `<!doctype html>`...to every single HTML file. Wouldn't it be nice if a header and footer was loaded on every page so you didn't have to copy and paste code?
    * Sinatra has this handy thing where a single layout can get rendered on every page. Create a file `layout.erb` in your views directory. All your code in there automatically gets loaded on every erb file. You code your header and footer, and where you want the unique code to go gets loaded by `<% yield %>`
    * See Code snippet 2 
  * Add a form for users to sign up for an account (essentially a ‘create users’ form - it will be similar to the create tweets form - follow the pattern!).
    * See Code Snippet 3
  * Encourage them to follow the patterns they used to create MVC for tweets
+ Connecting Tweets to Users
  * ActiveRecord makes it easy for us to build relationships between models with two methods called `belongs_to` and `has_many`
    * Ask the class - Do you think a user “has_many” tweets or “belongs_to” a tweet?
    * Start mapping out this relationship on the board.
  * So ultimately ActiveRecord will allow us to do something like this:
    * `user1.tweets` to get an array with all of a user's tweets
    * or `tweet1.user` to see who created tweet1
  * The first step towards making this connection is to add these methods to the appropriate models
    * See [code snippet 4](./code-snippets.md)
  * There is one more thing we need to do before this will work - we need to change out Tweets model to include a user_id column
    * The way `user1.tweets` works is by taking user1's id number and searching through the tweets table for any tweets with a matching user_id column
  * Any time we make a change to our database we need to create a migration with instructions for that change. Here is how you do that:
    * Create a change migration. In terminal enter: `rake db:create_migration NAME="modify_tweets"`.
    * In migration (in db directory) create `up` and `down` methods.
    * see [code snippet 5](./code-snippets.md)
    * In terminal: `rake db:migrate` to create the table
  * Now that we've modified the tweets table, our current data is no longer valid
  * Go into tux and do Tweet.destroy_all to destroy all of the tweets that are currently in the database
  * Now that we've modified our database we also need to update the info that is being stored in the database
  * Where do we get that input from our users? FORMS
+ Modifying the Tweets form
  * Now that we are connecting Tweets to Users via their user id we should probably modify our form to take in user id's instead of user name's
  * Have students update their forms accordingly
  * Create a tweet for user 1
  * Taking in user IDs is not the best way to set up a tweet because users don't always know their ID and if they input the wrong ID our application will error out
    * A much better solution is to create a list of current users that people can choose from
    * We can pull a list of users with `User.all` and create a drop down menu with that list
    * See [code snippet 6](code-snippets.md)

### Conclusion / So What?
* You guys now have the basic building blocks for setting up databases and applications just like the pros!


### Hints and Hurdles
* You may need to save the dropdown menu portion of modifying the form for the next class - there is a lot going on in this class
* Emphasize MVC and the need to and modify each portion of the MVC when making updates to the application
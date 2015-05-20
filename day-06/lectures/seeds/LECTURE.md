# Using Seeds - Full Lecture

## Objective

Seed our database with data to make our app actually functional. 

## SWBATs

+ Understand what a seeds file is and why we use it
+ Use a provided seeds file to populate their local database
+ Create and run their own seed files

## Moviation/Why Should You Care? 

So far, we've created an awesome twitter app, but we've only made a few users and tweets. What if we wanted to see what our app looks like with lots of users and tweets? We could create them one at a time, but that would take forever. We're programmers - we can automate tasks like that! An easy way to populate our database is by using a seeds file. 

## Lesson Plan

### The Seed File

+ If you haven't already, fork and clone today's project. You'll be working in groups to build your own version of Instagram, where you can send pictures to each other. 
+ Your app will have models for Photos and Users. 
+ In our Sinatra apps, where do we store our files related to the database?
	* In the `db` folder!
+ Inside our `db` folder, check out the file `seeds.rb`. 
+ Can someone walk me through what's going on in this file? 
	* We call the method create on our Photo model and pass in an array. 
	* Inside the array are many hashes. Each hash represents one photo. 
	* Inside of the hash is a key-value pair representing the photo's data. In this case it's a link.
+ So the seed file, we're just using a Ruby method to create lots of photos. 

### Running Rake.db seed

+ How do we actually execute this code?
+ First, we need to create our photos table. Can someone help me create a migration? 
	* `rake db:create_migration NAME=create_photos`
+ Next, in our create_photos file, we'll define our `up` and `down` methods. 
	* see [code snippet](./code-snippets.md)
+ Now, we need to run the code in our migration file. How can we do that?
	* `rake db:migrate`
+ Now, we can execute the code in our seeds file the same way. Open up your command line and run `rake db:seed`. 
	* This is a task that simply executes all of the code in that seed file. 
+ If it works, you won't see anything - no news is good news. 
+ To test it, we can start a console with `tux`. 
+ In `tux`, let's run `Photo.all`. If we see lots of photos, we know that it worked! 

## Conclusion/So What?

+ Using a Seeds file lets us create a lot of data to play around with very quickly. 
+ How could you use a seeds file to create 30 users, each with a random name? 
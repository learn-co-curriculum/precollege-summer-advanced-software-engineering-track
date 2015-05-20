# DAY-06 Using Seeds

_A full lecture is available [here](LECTURE.md)_

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
+ Sinatra apps store our files related to the database in the `db` folder!
+ Inside our `db` folder, check out the file `seeds.rb`. 
+ Can someone walk me through what's going on in this file? 
+ So the seed file, we're just using a Ruby method to create lots of photos. 

### Running Rake.db seed

+ How do we actually execute this code?
+ First, we need to create our photos table through a migration.
+ Next, in our create_photos file, we'll define our `up` and `down` methods.
+ Now, we need to run the code in our migration file.
+ Now, we can execute the code in our seeds file the same way.
+ If it works, you won't see anything - no news is good news. 
+ To test it, we can start a console with `tux`. 
+ In `tux`, let's run `Photo.all`. If we see lots of photos, we know that it worked! 

## Conclusion/So What?

+ Using a Seeds file lets us create a lot of data to play around with very quickly. 
+ How could you use a seeds file to create 30 users, each with a random name? 
##Objective
*Build a basic Sinatra application using the principles of MVC architecture*

## SWBATs

+ MODEL - Understand what a model is
+ MODELS - Build a model with attributes and actions
+ MODELS - Understand what attr_accessors are and how to use them
+ SINATRA - Understand why we use the MVC file structure and how models fit into it
+ CONTROLLERS - Understand why we need controllers (to set up routes and connect data from models to views)
+ CONTROLLLERS - Build GET request routes
+ CONTROLLERS - Connect specific routes to erb templates
+ CONTROLLERS - Connect information from models to views via controller and instance variables
+ VIEW - Understand how to create an erb template file (and how it is similar to an HTML file)
+ VIEWS - Understand what the `yield` statement in layout.erb does and why we use it
+ VIEWS - Understand why we  use instance variables in our views
+ VIEW - Understand how to use erb tags and instance variables to display dynamic information in views
+ SINATRA - Boot up server via rackup and run their app
+ SINATRA - Understand why we need a config.ru file
+ SINATRA - Understand what goes into the public folder, gemfile and config folder (environment configurations)
+ NB - Must use rackup (as opposed to shotgun) for this demo (shotgun restarts server every time page is refreshed and tweets disappear)

### Motivation / Why Should You Care?
You all built projects in Ruby 1 that you should be proud of, but you probably wanted to make them even bigger and better and add features that you didn’t know how to implement. We’re going to spend the next few weeks taking your skills to the next level. To that end we need to make sure that our foundation is solid before we get fancy. Today we are going to go over MVC frameworks and lay the groundwork for a basic Twitter project.

### Lesson Plan
In this lesson, students will be creating their own version of Twitter using Sinatra.
***Sample Completed Fwitter for this lesson can be found [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-1)***

**HOW WEB APPLICATIONS WORK**
+ MVC stands for Model View Controller
+ Models
  * The logic or code that goes into storing and maintaining the data in an application - like adding a tweet to your list of tweets - is the M in an MVC framework - the models.
  * The models are responsible for pulling data from database.
+ Views
  * The V in MVC stands for views and this directory is where we will store all of the HTML (and embedded Ruby) that gets displayed in the browser.
+ Controller
  * The C stands for Controller and the application controller file in our project will hold all the code that is in charge of making the back end - the Ruby logic - talk to the front end - the HTML in the browser that users interact with.
+ This MVC - model view controller - framework is the way that most modern web applications are organized.
  * Keeping the functionality of our application in these separate directories helps us stay organized as our apps become more and more complex.
+ We will be using a gem called Sinatra to set up our MVC framework and create our applications.
  * We’ll be going into depth about how each component of the Sinatra MVC performs each of these actions, but first we need to create a new blank Sinatra project and put in all the empty directories and files that will keep us organized as we build our project.
+ **First Challenge for Students:**
  * Use terminal and your `mkdir`, `touch` and `cd` commands to build out this [file structure](https://github.com/learn-co-curriculum/hs-advanced-ruby-project-setup)

**CREATING A GITHUB REPO**
+ We'll be saving student progress on GitHub so they'll all need to set up GitHub repos
+ Here are instructions: https://github.com/learn-co-curriculum/hs-git-commit-catchup

**SINATRA WALKTHROUGH**
***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-1-code-snippets)***
+ **Gemfile:** This is where we bring in Gems (open source code) that we can use in our project.
  * Create a development group - for working locally on our computer.
  * Look at the code snippet for Gemfile
  * In terminal in the directory of the project, run `bundle install` once you save the changes to your gemfile

+ **Config.ru:** This file controls the instructions that actually run our app
  * To run our application we’ll need to start up a server with a tool like the `rackup` gem.
  * This file tells the server where to find an run the application
  * See code snippet 2

+ **Public Directory:** This holds all of the front end assets for our program. Assets include javascript, css and images.

+ **Config Directory:** Contains the`environment.rb` file.
  *Environment.rb contains the configurations for running different parts of your app. We'll be adding the bundler gem here which makes sure that all parts of your application have access to the gems in your Gemfile.
  * See code snippet 3

+ **App Directory:** This holds your MVC directories and files.
  * **Controllers**
    * `application_controller.rb`: connects your application to the Sinatra gem.
    * We need `config/environment.rb` to talk to this file, (require lines in code snippet 4)
    * We need to create an ApplicationController class that inherits from Sinatra base. This gives us useful methods to help us navigate our application.
    * We need to configure our app to find our views and the public folder
    * See code snippet 4
  * **Models**
    * This holds our backend code - it's where you would find a Tweet or User class
    * Set up a `tweet.rb` folder in this directory with a Tweet class with two attributes - username and status.
    * We also need a constant ALL_TWEETS which will hold an array of our tweet instances. Newly created tweets will be added upon initialization
    * See code snippet 5
  * **Views**
    * This holds HTML and erb files. Erb stands for embedded Ruby
    * Write some valid HTML with a placeholder where the tweets will displayed in `index.erb`
    * See code snippet 6

**CONNECTING THE MVC COMPONENTS**
+ Setting up a route in the application controller
  * The controller is like a waiter that goes between the chef cooking up the meal (Model) and the customers receiving the food (Views)
  * Routes are set up to match the URL in the navigation bar of the browser.
  * Using http://www.audiomydarling.com/ as an example.
    * When users go this URL with their browser they are triggering the '/' route
    * When they go to http://www.audiomydarling.com/fiddle they are triggering the '/fiddle' route
    * When they go to http://www.audiomydarling.com/contact they are triggering the '/contact' route
  * The controller should be set up to serve up the correct HTML/erb files for each of these routes.
    * so '/fiddle' might send a `fiddles.erb` file to the browser with text, photos, links, etc. about fiddles
    * and '/contact' should send a `contact.erb` file to the browser that contains contact info, etc.
  * We'll start off by just displaying some text:
    * See code snippet 7
  * To display this in the browser you'll need to start up a server on your computer - we use the rackup gem for this
    * type `rackup` into your terminal to start up the server
    * you should see a port number :9292 got to localhost:9292 to see what is being displayed at '/'
  * Then show how to serve up an erb file - we do this because it's much cleaner than adding all of the HTML in our controller as one big string
    * See code snippet 8
    * Restart the server to see this
  * Then create tweet instances inside the '/' route and show how to display them in `index.erb`
    * We can write Ruby in an .erb using erb brackets
      * There are two types `<% %>` let you write Ruby and nothing will be displayed on the screen
      * `<%= %>` will actually show the results of the Ruby you are writing in the browser
    * See code snippet 9

### Conclusion / So What?
* Understanding how to use Sinatra and MVC will give you the tools to build any kind of web application you want using Ruby/HTML/CSS

### Hints and Hurdles
+ Spend time at the beginning of class to review Ruby basics
+ Lean hard on the code snippets if students run into bugs
+ Students misspell initialize A LOT


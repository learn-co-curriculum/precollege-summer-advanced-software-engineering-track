## SWBATs
*Build a basic Sinatra application using the principles of MVC architecture*

### Motivation / Why Should You Care?
You all built projects in Ruby 1 that you should be proud of, but you probably wanted to make them even bigger and better and add features that you didn’t know how to implement. We’re going to spend the next few weeks taking your skills to the next level. To that end we need to make sure that our foundation is solid before we get fancy. Today we are going to go over MVC frameworks and lay the groundwork for a basic Twitter project.

### Lesson Plan
In this lesson, students will be creating their own version of Twitter using Sinatra.
***Sample Completed Fwitter for this lesson can be found [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-1)***

**HOW WEB APPLICATIONS WORK**
+ MVC stands for Model View Controller
+ Models
  * The logic or code that goes into storing and maintaining the data in an application is the M in an MVC framework.
+ Views
  * The V in MVC stands for views and this directory is where we will store all of the HTML (and embedded Ruby) that gets displayed in the browser.
+ Controller
  * The C stands for Controller and the application controller file in our project will hold all the code that is in charge of making the back end talk to the front end.
+ We will be using a gem called Sinatra to set up our MVC framework and create our applications.

+ **First Challenge for Students:**
  * Use terminal and your `mkdir`, `touch` and `cd` commands to build out this [file structure](https://github.com/learn-co-curriculum/hs-advanced-ruby-project-setup)

**CREATING A GITHUB REPO**
+ We'll be saving student progress on GitHub so they'll all need to set up GitHub repos
+ Here are instructions: https://github.com/learn-co-curriculum/hs-git-commit-catchup

**SINATRA WALKTHROUGH**
***Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-1-code-snippets)***
+ **Gemfile:** This is where we bring in Gems (open source code) that we can use in our project.
  * Create a development group - for working locally on our computer (See code snippet 1)
  * In terminal in the directory of the project, run `bundle install` once you save the changes to your gemfile

+ **Config.ru:** This file controls the instructions that actually run our app
  * To run our application we’ll need to start up a server with a tool like the `rackup` gem.
  * See code snippet 2

+ **Public Directory:** This holds all of the front end assets for our program. Assets include javascript, css and images.

+ **Config Directory:** Contains the`environment.rb` file.
  *Environment.rb contains the configurations for running different parts of your app.
  * See code snippet 3

+ **App Directory:** This holds your MVC directories and files.
  * **Controllers**
    * `application_controller.rb`: connects your application to the Sinatra gem.
    * See code snippet 4
  * **Models**
    * This holds our backend code - it's where you would find a Tweet or User class
    * Set up a `tweet.rb` folder in this directory 
    * See code snippet 5
  * **Views**
    * This holds HTML and erb files.
    * See code snippet 6

**CONNECTING THE MVC COMPONENTS**
+ Setting up a route in the application controller
  * Routes are set up to match the URL in the navigation bar of the browser.
  * The controller should be set up to serve up the correct HTML/erb files for each of these routes.
    * See code snippet 7
  * To display this in the browser you'll need to start up a server on your computer - we use the rackup gem for this
    * type `rackup` into your terminal to start up the server
    * you should see a port number :9292 got to localhost:9292 to see what is being displayed at '/'
  * Then show how to serve up an erb file
    * See code snippet 8
  * Then create tweet instances inside the '/' route and show how to display them in `index.erb`

### Conclusion / So What?
* Understanding how to use Sinatra and MVC will give you the tools to build any kind of web application you want using Ruby/HTML/CSS

### Hints and Hurdles
+ Spend time at the beginning of class to review Ruby basics
+ Lean hard on the code snippets if students run into bugs
+ Students misspell initialize A LOT


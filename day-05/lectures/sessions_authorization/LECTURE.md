## Objective
***Incorporate user authentication and sessions in a Sinatra to maintain a logged in state and keep track of data as a user moves through your app***
## SWABTS

+ SESSIONS - Understand why we use sessions
+ SESSIONS - Understand how websites use cookies to keep track of users from page to page
+ SINATRA - Enable sessions in Sinatra
+ FORMS - Set up sign in view with sign in and sign up forms
+ MVC - Set up sign in controller that creates a new session
+ MVC - Modify sign up controller to create a new session
+ SINATRA - Create and understand how to use Sinatra helper methods like signed_in? and current_user
+ VIEW - Use if/else with erb tags to control what is displayed to the user in a view
+ Advanced kids - Have them create custom error messages? Run with helper methods and if/else statements to customize views as much as possible?


## Motivation / Why Should You Care?
Browsers are like goldfish - they have no memory. Every time you go from one page to the next - or click refresh - your browser completely erases any memory of what happened on the last page. So how does a web application like Twitter keep track of who you are as you move from page to page? Browsers maintain the illusion of continuity through something called cookies. 


## Lesson Plan
***Continuing to use the Fwitter Project***

*** Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-5-code-snippets)***

*** Look at the completed sample Fwitter [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-5)***

+ **COOKIES**
  * Little pieces of data that a web application or website stores on your computer - like a trail of crumbs leading back to you.
  * They usually contain a unique string of letters and numbers that helps the site/app keep track of who you are - by keeping track of your session - your time logged into or visiting the site. 
  * If you’ve ever added something to an online shopping cart or logged onto a web application then you have experience with cookies.
  * You can see the details of these cookies in the Chrome browser. (Students do this)
    * Under the Chrome menu hit Settings
    * Click the link at the bottom of the page for “Show advanced settings”
    * Under Privacy click “Show content settings” then “All cookies and site data”
    * You’ll see a list of all the websites that have stored cookies on your computer (it’s probably a surprisingly long list!)
    * In the search box in the top right corner of the modal start typing ‘learn.flatironschool.com’
    * Then click on ‘learn.flatironschool.com’, and the cookie named _feyonce_session
    * This is the cookie that the Flatiron School uses to track you when you are logged in to Learn
    * That long string of numbers and letters under `content` is the session ID
    * You can also see that this session ID expires when the browsing session ends (when you log out)
    * So every time you visit the domain `learn.flatironschool.com` it creates a new session ID (to track you while you are logged in)
  * Apps use authentication (logging in with a PW) so that no one can pretend to be you. You wouldn't want someone posting to Facebook or Instagram as you

+ **SESSIONS**
  * We’re going to start out by asking users to sign up/sign in with only an email address - no password. 
  * Setting up passwords for our users is the first step in authentication - the process of confirming that someone is who they say they are - and we’ll do that in the next class. 
  * Today we’re just covering authorization - asking our users to sign in before they are allowed to use certain features - and restricting certain features to logged in users. 
  * Enable Sessions in our App - so we can store a cookie in user's computer by adding lines of code to the configuration block in `application_controller.rb`
    * See code snippet 1
    * You can actually set your session secret to anything that you want. The session secret will be used to create a session_id (a unique string of numbers and letters) that is stored in the cookie. 
    * Make sure students push to github here
  * When we enable sessions in Sinatra our application starts generating cookies and each cookies is going to have a session hash with information like that session_id that we saw earlier. 
    * put a `binding.pry` inside of the `GET '/'` route. Make sure `require pry` is at the top of the `application_controller.rb`
    * once your app freezes, in terminal you will be in pry. You can enter `sessions` to look at the sessions hash.
    * `session` hash includes a session_id - that long string of numbers and letters that we saw in our cookie (when we looked at our cookies in Chrome) that serves as a unique identifier for our session or visit to the site.
    * We want to use this hash for is tracking users from one page to the next.
  * What attribute does each user have that is unique to them? IDS!
  * So if we want to track users from one page to the next adding a session[:user_id] to the hash would a good way to do that. When users log in we want to add a key-value pair like this to our sessions hash.
* Every time we modify our program what are the three things we need to think about? What are the three component of an MVC application that we have to think about every time we create a new feature?
  * M - Model. We have a users model so that is a good start. When you log into a site what kind of information do you usually need to type in? Email and password.
    * We’ve already got email addresses so we’ve got that covered. Excellent. M is done.
  * V - Views. This is the part of the application that our users will interact with. What do you usually see when you are asked to log into a site? 
    * We need a Sign In form. We already have a Sign Up form set up to create new users and I’m a lazy programmer so I’m going to reuse this for our Sign In form with one small modification. 
    * See Code Snippet 2
    * What part of our form determines where the form information is sent when it is submitted (which route/URL the form connects to)? Where do we want info from our Sign In form to be sent?
    * The action attribute of the form tag in our Sign In form should point to a  ‘/sign-in’ route in the application controller. 
  * C - Controller part of our application. I’m going to create a blank ‘sign-in route for now and have everyone set up their sign in form in their views and a sign in route in their controller.
    * Need to create the POST request - see code snippet 3
    * We need to add session[:user_id] to the hash so that we can track users after they log in.
    * Use ActiveRecords `find_by` method to find a user based on their email address and name. We pass these in as the arguments to this method, in the same way that the `create` method takes in paramaters
    * Use pry to make sure getting in the right params in the sign in form
    * Now that we know we’ve found the user who is signing in, we can say `@user = User.find_by(name: "danny", email: "danny@flatironschool.com")` and `assign session[:user_id] = @user.id` and use `session[:user_id]` to track our user.
    * Use pry to take a to take another look at our session hash and at @user (to make sure we are getting the right user). 
    * The new key-value pair, session[:user_id], has been added to the session hash and will be available to us throughout our application. It can be used to quickly confirm which user is navigating from page to page. Everyone set this up in their `/sign-in` route. 
    * Then commit and push to github. 
    * Now turn to a neighbor and explain this process of getting a user signed in. 
    * One last step - have your `/sign-in` route redirect back to the TWEETS page.

+ **RESTRICTING NON-SIGNED IN USERS**
  * We don't want non-signed in users to be able to tweet, so we need to restrict things- do this through ruby if/else statements
  * We can add if/else statement to our erb templates using erb tags. 
    * Our if/else statements will check if the user is signed in and display one thing if they are signed in and another thing (or nothing at all) if they are not.
    * To do this, I’m going to wrap my entire Tweets form in an if statement
      * See Code snippet 4
      * git commit and push

+ **SIGNING PEOPLE OUT**
  * Now we need a way for users to log out
  * Let’s create a link that users can click to sign themselves out. Every time we create a new link in our view what do we have to do next? We need to create a route in our controller.
    * See code snippet 5
    * We’re tracking whether our users are signed in based on the presence of a session[:user_id]
    * Inside our sign-out route we’ll set `session[:user_id] = nil`
    * Direct back to `'/tweets'`
  * Now we need to restrict people so they can only tweet from their own account. Instead of a dropdown of all users, need to display just theirs
    * see code snippet 6
    * Let’s automatically populate the form with the current user’s name and their ID. I’m also going to use a handy form feature the input tag of `type="hidden"` to populate the form with the user’s ID (but not display this on the screen).
      *  How does this erb template know who the current user is? 
      * How are we tracking our users from page to page? How do we find this current user and set @user to the current user?
      * When the user signed in that we set the session[:user_id] to the current user’s ID. Use `find_by` method we learned about earlier in class to find the current user from the `session[:user_id`] - `User.find_by(:id => session[:user_id])`
    * Everyone set this up in their `/tweets` route and git commit and push. Try signing up a few more users and signing in and signing out.

## Conclusion / So What?
Applications are powered by specific user input, whether your posting a comment to a news article, uploading an image to Instagram, or liking your friends posts on Facebook.Sessions and authorization are used to keep track of a single user's activity on an application, and prohibit a user from posting content as someone else.

## Hints and Hurdles
+ This is a long class, definitely give them a break
+ Test things constantly - use pry, do in browser testing
+ When live coding, don't worry about making mistakes. Use the students to help you debug. It's actually nice for the students to see the teacher make a mistake. It makes them feel better about mistakes they make
#DAY-05 Sessions Authorization

_A full lecture is available [here](LECTURE.md)_

##SWBATs
***Incorporate user authentication and sessions in a Sinatra to maintain a logged in state and keep track of data as a user moves through your app***

## Motivation / Why Should You Care?
Browsers are like goldfish - they have no memory. Every time you go from one page to the next - or click refresh - your browser completely erases any memory of what happened on the last page. So how does a web application like Twitter keep track of who you are as you move from page to page? Browsers maintain the illusion of continuity through something called cookies. 

### Lesson Plan

+ **COOKIES: **Little pieces of data that a web application or website stores on your computer - like a trail of crumbs leading back to you.
  * They usually contain a unique string of letters and numbers that helps the site/app keep track of who you are - by keeping track of your session - your time logged into or visiting the site. 

+ **SESSIONS**
  * We’re going to start out by asking users to sign up/sign in with only an email address - no password. 
  * Today we’re just covering authorization - asking our users to sign in before they are allowed to use certain features - and restricting certain features to logged in users. 
  * Enable Sessions in our App - so we can store a cookie in user's computer by adding lines of code to the configuration block in `application_controller.rb`  
  * Enabling sessions generates a cookie, with a session hash 
  * We want to use this hash for tracking users from one page to the next.

+ **Controller Action:**
```ruby
  post '/sign-in' do
    @user = User.find_by(:email => params[:email], :name => params[:name])
    if @user
      session[:user_id] = @user.id
    end
    redirect '/tweet'
  end
``` 
   
  * The new key-value pair, session[:user_id], has been added to the session hash and will be available to us throughout our application so we can track users from one page to the next. 

+ **RESTRICTING NON-SIGNED IN USERS**
  * We don't want non-signed in users to be able to tweet, so we need to restrict things- do this through ruby if/else statements in our erb files

+ **SIGNING PEOPLE OUT**
  * Let’s create a link that users can click to sign themselves out. 

  * Inside our sign-out route we’ll set `session[:user_id] = nil`
  * Now we need to restrict people so they can only tweet from their own account. Instead of a dropdown of all users, need to display just theirs
    * Automatically populate the form with the current user’s name and their ID.

+ **HELPER METHODS**
  * Helper methods set up in the controller allow us to use them in the views
  * Help methods usually keep track of specific tasks such as a current user
  * We can use a block to define our helper methods
  * Helper methods can be used in the view

### Conclusion / So What?
Applications are powered by specific user input, whether your posting a comment to a news article, uploading an image to Instagram, or liking your friends posts on Facebook.Sessions and authorization are used to keep track of a single user's activity on an application, and prohibit a user from posting content as someone else.

### Hints and Hurdles
+ This is a long class, definitely give them a break
+ Test things constantly - use pry, do in browser testing
+ When live coding, don't worry about making mistakes. Use the students to help you debug. It's actually nice for the students to see the teacher make a mistake. It makes them feel better about mistakes they make
#DAY-05 Sessions Authorization

_A full lecture is available [here](LECTURE.md)_

##SWABTS
***Incorporate user authentication and sessions in a Sinatra to maintain a logged in state and keep track of data as a user moves through your app***


## Motivation / Why Should You Care?
Browsers are like goldfish - they have no memory. Every time you go from one page to the next - or click refresh - your browser completely erases any memory of what happened on the last page. So how does a web application like Twitter keep track of who you are as you move from page to page? Browsers maintain the illusion of continuity through something called cookies. 


### Lesson Plan

*** Code snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-5-code-snippets)***

*** Look at the completed sample Fwitter [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-5)***

+ **COOKIES: **Little pieces of data that a web application or website stores on your computer - like a trail of crumbs leading back to you.
  * They usually contain a unique string of letters and numbers that helps the site/app keep track of who you are - by keeping track of your session - your time logged into or visiting the site. 
  * Apps use authentication (logging in with a PW) so that no one can pretend to be you. You wouldn't want someone posting to Facebook or Instagram as you

+ **SESSIONS**
  * We’re going to start out by asking users to sign up/sign in with only an email address - no password. 
  * Today we’re just covering authorization - asking our users to sign in before they are allowed to use certain features - and restricting certain features to logged in users. 
  * Enable Sessions in our App - so we can store a cookie in user's computer by adding lines of code to the configuration block in `application_controller.rb`
   ```ruby
    enable :sessions
    set :session_secret, 'fwitter'
   ```
    * Session secret can be set to set to anything that you want. The session secret will be used to create a session_id (a unique string of numbers and letters) that is stored in the cookie. 
    
  * Enabling sessions generates a cookie, with a session hash 
  ```ruby
  session = {
    :session_id => long_string_letters_numbers
  }
  ```
  * We want to use this hash for tracking users from one page to the next.

+ **Sign In form:**
```html
  <h3>Sign In</h3>
  <form action="/sign-in" method="POST">
    <p>Name: <input type="text" name="name"></p>
    <p>Email: <input type="text" name="email"></p>
    <input class="btn btn-primary" type="submit">
  </form>
```

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
```ruby
<% if session[:user_id] %>
  <h2>Add a tweet</h2>
  <form action="/tweet" method="POST">
    <p>User:
      <select name="user_id">
        <% @users.each do |user| %>
          <option value="<%= user.id %>"><%= user.name %></option>
        <% end %>
      </select>
    </p>
    <p>Status: <input type="text" name="status"></p>
    <input class="btn btn-primary" type="submit">
  </form>
<% end %>
```
+ **SIGNING PEOPLE OUT**
  * Let’s create a link that users can click to sign themselves out. 
```ruby
  get '/sign-out' do
  session[:user_id] = nil
  session[:error] = nil
  redirect '/'
end
```
  * Inside our sign-out route we’ll set `session[:user_id] = nil`
  * Now we need to restrict people so they can only tweet from their own account. Instead of a dropdown of all users, need to display just theirs

  ```html
  <% if session[:user_id] %>
    <h2>Add a tweet</h2>
    <form action="/tweet" method="POST">
      <p><strong>User:</strong> <%= @user.name %> <input type="hidden" name="user_id" value="<%= @user.id %>"></p>
      <p><strong>Status:</strong> <input type="text" name="status"></p>
      <input class="btn btn-primary" type="submit">
    </form>
  <% end %>
  ```
    * Automatically populate the form with the current user’s name and their ID.
     * `type="hidden"` to populate the form with the user’s ID (but not display this on the screen).

### Conclusion / So What?
Applications are powered by specific user input, whether your posting a comment to a news article, uploading an image to Instagram, or liking your friends posts on Facebook.Sessions and authorization are used to keep track of a single user's activity on an application, and prohibit a user from posting content as someone else.

### Hints and Hurdles
+ This is a long class, definitely give them a break
+ Test things constantly - use pry, do in browser testing
+ When live coding, don't worry about making mistakes. Use the students to help you debug. It's actually nice for the students to see the teacher make a mistake. It makes them feel better about mistakes they make
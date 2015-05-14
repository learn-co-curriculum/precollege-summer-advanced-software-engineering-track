---
tags: sessions, kids, ruby, advanced, code snippets
language: ruby
level: 2
type: code snippets
---

## The Code Cherry On Top

### application_controller.rb Code snippet 1
We just need to make one small change to the Sinatra configurations in our application controller to enable sessions in our application by adding the following lines of code:

```ruby
enable :sessions
set :session_secret, 'fwitter'
```

You can actually set your session secret to anything that you want. It will be used to create a session_id (a unique string of numbers and letters) that is stored in a browser cookie. (If you missed class check out the All About Cookies section.)

This is a pretty minimal security feature, but the basic idea is that setting your :session_secret to a word that other people don’t know makes it harder for someone to create a fake session_id and hack into your site without signing up or signing in.

The configure block in your application controller should now look like this:

```ruby
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'fwitter'
  end

end
```

You're ready to session! If you missed class, move on to the Sinatra Sessions Walkthrough.


### users.erb - Code snippet 2
Include the code above the Sign Up form

```html
 <h3>Sign In</h3>
  <form action="/sign-in" method="POST">
    <p>Name: <input type="text" name="name"></p>
    <p>Email: <input type="text" name="email"></p>
    <input class="btn btn-primary" type="submit">
  </form>
  </br>
```

### application_controller.rb  - Code snippet 3
```ruby 
  post '/sign-in' do
    @user = User.find_by(:email => params[:email], :name => params[:name])
    if @user
      session[:user_id] = @user.id
    end
    redirect '/tweet'
  end
```

### tweets.erb - Code snippet 4
```erb
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


### application_controller.rb - code snippet 5
```ruby
  get '/sign-out' do
    session[:user_id] = nil
    session[:error] = nil
    redirect '/'
  end
```

### tweets.rb - code snippet 6

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



# ActiveRecord Code Snippets

Here is the code that you will need to add to your application to get set up with a users table.

## Code Snippet 1

### Migration up and down methods for Users migration
```ruby
def up
  create_table :users do |t|
    t.string :name
    t.string :email
  end
end

def down
  drop_table :users
end
```

### Our new file, User.rb, contains the following:
```ruby
class User < ActiveRecord::Base

end
```
## Code Snippet 2

### Layout.erb

```html
<!doctype html>
<html>
  <head>
    <title>Week 4</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <div class="container">
      <h1>Welcome to Fwitter!</h1>

      <%= yield %>

      <div class="footer">
        <h4><a href="/tweet">Tweet</a> | <a href="/users">Users</a></h4>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
```

## Code Snippet 3

###Create User Form (User Sign Up)
In `users.erb`:
```html
<h3>Sign Up</h3>
<form action="/sign-up" method="POST">
  <p>Name: <input type="text" name="name"></p>
  <p>Email: <input type="text" name="email"></p>
  <input class="btn btn-primary" type="submit">
</form>

In `application_controller.rb`:
```ruby
  post '/sign-up' do
    @user = User.new(:name => params[:name], :email => params[:email])
    @user.save
    redirect '/'
  end
```

## Code Snippet 4

### Updating the User and Tweets models

In `tweet.rb` file: 

```ruby
class Tweet < ActiveRecord::Base
  belongs_to :user

end

In `user.rb` file:
class User < ActiveRecord::Base
  has_many  :tweets

end
```
##Code Snippet 5

### Creating a modify tweets migration
```ruby
  def up
    remove_column :tweets, :user, :string
    add_column :tweets, :user_id, :integer
  end

  def down
    add_column :tweets, :user, :string
    remove_column :tweets, :user_id, :integer
  end
```
## Code Snippet 6

### Modifying the tweet form

In `application_controller.rb` add in `@users = User.all`
```
get '/' do
  @tweets = Tweet.all
  @users = User.all
  erb :index
end
```

In `tweet.erb`
```
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
```


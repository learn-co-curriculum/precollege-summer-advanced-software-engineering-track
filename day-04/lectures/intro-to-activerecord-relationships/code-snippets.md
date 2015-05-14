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

### Updating the User and Tweets models
```ruby
class Tweet < ActiveRecord::Base
  belongs_to :user

end

class User < ActiveRecord::Base
  has_many  :tweets

end
```
## Code Snippet 3

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
## Code Snippet 4

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


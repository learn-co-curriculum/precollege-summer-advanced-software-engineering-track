---
tags: active record, kids, ruby, advanced, code snippets
language: ruby
level: 2
type: code snippets
---

## A pinch of delicious, delicious code

Here is the code that you will need to add to your application to get set up with ActiveRecord.

### Gemfile - Code snippet 1
(These should go right below your sinatra gem.)

```ruby 
gem "activerecord"
gem "sinatra-activerecord"
gem "rake"
```

We also need to add the sqlite3 gem to your `development` group so that it looks like this:

```ruby
group :development do
  gem "pry"
  gem "tux"
  gem "sqlite3"
end
```

### Rakefile - Code snippet 2

This code is all you need in your Rakefile for now:

```ruby
require 'sinatra/activerecord/rake' 
```

The rake gem automatically provides all of the rake tasks (commands) that you need to build your database. Type `rake -T` in the terminal to see a list of available commands.

### Migration up and down methods - Code snippet 3
```ruby
  def up
    create_table :tweets do |t|
      t.string :user
      t.string :status
    end
  end
  def down
    drop_table :tweets
  end
```

### environment.rb  - Code Snippet 4
(In the config directory. This should go right below `Bundler.require`.)

```ruby
configure :development do
  set :database, "sqlite3:db/database.db"
end
```

This sets up a connection to the database we will be creating.

### Rakefile - Code snippet 5
```ruby
  './config/environment'
```


### tweet.rb - Code snippet 6
(in the app/models directory)

This is all the code that you need to create new tweets, add tweets to your database, pull saved tweets from the database and to view and change all of the tweets attributes (like user and status).

```ruby
class Tweet < ActiveRecord::Base

end
```

### application_controller.rb - Code snippet 7

```ruby
  POST '/tweet' do
    tweet = Tweet.new({:user => params[:user], :status => params[:status]})
    tweet.save
    redirect ‘/tweets’
  end

```

Your tweet class inherits all of that functionality (and more!) from the Active Record gem. Thank you Active Record!

### Did you miss class?

If you missed class, go check out the Study Guide. It will walk you through setting up your database and creating tables to store your data.

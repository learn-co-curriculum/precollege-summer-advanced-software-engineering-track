#Dyanmic URLs - Full Lecture

##Objective

*Understand Dynamic URLS and incorporate them into an application*

## Motivation / Why Should You Care?
How does Twitter post your tweets? How does facebook upload your photos? How does tumblr air your most secret guilty pleasures? All of these web applications take in information from a user, mutate that information, and then display it back to the user.

Web applications sometimes use the URL to pass information from the frontend to the backend.



## Lesson Plan
+  A dynamic url is a url comprised of two things: a static component and a dynamic component. The static components of a URL are parts like `www.pinterest.com`. The dynamic part of the url changes based on an action a user takes in order for a specific page to load, like when I click a link for a brownie pin: `http://www.pinterest.com/pin/126311964524247168/`


+ Let's start with a basic Sinatra controller:

```ruby
  require 'rubygems'
  require 'sinatra'

  get '/hello/:name' do 
    "hey there #{params[:name]}"
  end
```

+ Here, we have a route processed by a GET request, but there is a part of that route that looks a little funny - the `:name` portion.

+ In this example, we expect the `:name` portion of the route to change. You could enter `localhost:9292/hello/victoria` or `localhost:9292/hello/danny`. This route will change the actual text of the page so we should see `Hey there victoria` and `Hey there Danny` respectively.

+ So how can we have a route that changes based on a user id so that each user can have their own profile page:
```ruby
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :"users/show"
  end
```


### Conclusion / So What?
+ Dynamic routes are a really powerful way to create a lot of different views by only creating one controller action.
Image a site like Facebook with 2 billion users. There is no way that they have an individual route in their controller created for each user. That would be an absurd amount of work to maintain it all!


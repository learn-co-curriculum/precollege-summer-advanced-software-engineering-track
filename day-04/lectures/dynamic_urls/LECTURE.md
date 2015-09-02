#Dyanmic URLs - Full Lecture

##Objective

*Understand Dynamic URLS and incorporate them into an application*

##SWBATs

+ Identify a dynamic URL
+ Understand how dynamic URLs work to display object specific information

## Motivation / Why Should You Care?
How does Twitter post your tweets? How does facebook upload your photos? How does tumblr air your most secret guilty pleasures? All of these web applications take in information from a user, mutate that information, and then display it back to the user.

Web applications sometimes use the URL to pass information from the frontend to the backend.


## Lesson Plan

+ One way to pass information from the backend to the frontend is by using dynamic urls. A dynamic url is a url comprised of two things: a static component and a dynamic component. The static components of a URL are parts like `www.pinterest.com`. The dynamic part of the url changes based on an action a user takes in order for a specific page to load. This action can be clicking a link, or like in this lab, manually changing the URL.

+ An example of this would be clicking on a specific pin in pinterest. I start out at `www.pinterest.com`, become intrigued about a brownie I see, and click the link. When the page about the brownie loads, the URL changes to `http://www.pinterest.com/pin/126311964524247168/`. Let's say we wanted to look at another pin, a pasta recipe, `http://www.pinterest.com/pin/33565959698376056/`. If you click around to different pins on pinterest, you'll notice that you always see www.pinterest.com/pin/ (the static part of the URL) followed by a long string of numbers that changes with each pin (the dynamic part of the url). That long string of numbers is an ID that pertains to a specific pin. Just like we all have social security numbers that are unique to each of us, these ids (the long string of numbers) are unique to each individual pin.

Let's start with a basic Sinatra controller:

```ruby
  require 'rubygems'
  require 'sinatra'

  get '/hello/:name' do 
    "hey there #{params[:name]}"
  end
```

Here, we have a route processed by a GET request, but there is a part of that route that looks a little funny - the `:name` portion.

In this example, we expect the `:name` portion of the route to change. You could enter `localhost:9292/hello/victoria` or `localhost:9292/hello/danny`. This route will change the actual text of the page so we should see `Hey there victoria` and `Hey there Danny` respectively.

Say that we wanted to build out a user profile page. We could setup a route to handle this:

```ruby 
	get '/users/:id' do
	end
```
Going to "/users/1" should show us the first users profile page, "/users/2" the second, and so on. How do we actually get that information into the view? First, we can find the user by the id number from the URL params and render a user profile page. 

```ruby
	get 'users/:id' do
		@user = User.find(params[:id])
		erb :profile
	end
```

Now, in our view, we can simply create a template around whatever user we've loaded using ERB.

```erb
<h1><%= @user.username </h1>
<p><%= @user.email %></p>
```
**Challenge**

+ Boot up your localhost and run the practice code. Use your browser to try out the get request. Say hello to yourself. Say hello to someone else. Get crazy.
+ Create another get request in your controller with a different kind of parameter and message, then try it out in the browser.

### Conclusion / So What?
+ Dynamic routes are a really powerful way to create a lot of different views by only creating one controller action.
Image a site like Facebook with 2 billion users. There is no way that they have an individual route in their controller created for each user. That would be an absurd amount of work to maintain it all!

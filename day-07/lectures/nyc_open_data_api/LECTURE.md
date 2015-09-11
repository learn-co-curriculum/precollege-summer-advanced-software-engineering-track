# APIs - Full Lecture

## Objective
**Students will be able to write a basic Ruby wrapper for an API***

## SWBATs

+ Read API documentation
+ Parse through a JSON response in a Ruby application
+ Incorporate an API into their final project

## Motivation
![Web APIs](https://s3.amazonaws.com/after-school-assets/API.png)
Think about how many cool apps there are out there: Instagram, Yelp, Yumly, Foursquare, Spotify (etc). There are a million; too many to list. All of these apps have a way for you to sign up and interact with the application. With Instagram, you can upload photos, search hashtags, and look at all the photos tagged in a specific location. 

In the same way that you can interact with an application, a program can as well. API stands for "Application Programming Interface". In a nutshell, an API is a set of instructions that allows developers to change and control existing web applications. It's a way for the developers of existing applications to allow other people to get their data in a controlled way. For example, the Facebook API has a specific function that allows developers to integrate posting to a Facebook wall. The Twitter API has a function that allows developers to display all of a user's tweets.And New York City provides tons of data about the city through it's Open Data API. 

## Lesson Plan

### APIs

+ APIs can extend the functionality of our applications in many ways. 
	+Twilio, for example, allows us to send text messages to our users. 
	+Google Maps allows us to embed customizable maps into our pages. 
+ Today, we'll be checking out data from [NYC Open Data](https://nycopendata.socrata.com/) - a huge collection of data sets from the city. 
+ These APIs, and many others, such as Giphy and Twitter, will return us data in the form of JSON.
	+ JSON stands for JavaScript Object Notation - we'll take a closer look at how it works in a minute. 
+ Right now, take a few minutes and browse through some of the available datasets. Choose one that's interesting to you. 
	+ Give the students a few minutes - prompt them to call out some of the interesting APIs that they notice.
+ Right now, let's look together at an API showing the location of [Public Recycling Bins](https://data.cityofnewyork.us/Environment/Public-Recycling-Bins/sxx4-xhzg) in the city. Some of you may have seen this in a lab from Intro to Software Engineering.
+ Click on export and then soda API gives us our API Endpoint - this is a URL that we make a web request to. **Teacher: paste this url into your browser: http://data.cityofnewyork.us/resource/sxx4-xhzg.json **
+ So we've made a web request and the server has responded with JSON instead of HTML. 
+ JSON, like HTML, can be represented in Ruby as a giant string. But what do you notice about it? 
	+ Brackets, Curly Braces, Key-Value pairs...
	+ That's right, it's a nested data structure - in this case an array full of hashes.

### Writing a Ruby Wrapper

+ Many APIs actually have Ruby gems that we can incorporate into our applications, but it's not that hard to write them yourself. Let's create a class that we can use to access this data in our Sinatra app.
+ Make a new file called "recycle_bin.rb" Inside, let's define a class called "RecycleBin"
+ We're also going to require two gems - "open-uri" is a gem to make web requests, and "json" will allow us to parse the JSON string into an actual data structure. 
```ruby
require 'open-uri'
require 'json'

class RecycleBin

end
```

Now, let's make a method that returns to use the data. Let's call it data. First, it should make a web request to the url that we want - we can do this using open-uri's "open" method. 

```ruby
require 'open-uri'
require 'json'

class RecycleBin

	def data
		url = "http://data.cityofnewyork.us/resource/sxx4-xhzg.json"
		response = open(url).read
	end

end
```

Next, we'll turn that response into an array by parsing the JSON. We do this using a method called `parse` on the JSON class.

```ruby
require 'open-uri'
require 'json'

class RecycleBin

	def data
		url = "http://data.cityofnewyork.us/resource/sxx4-xhzg.json"
		response = open(url).read
		data = JSON.parse
	end

end
```

+ Awesome! Our data method now returns to use the entire array. We can now use the data to write any other methods we like. 

```ruby
require 'open-uri'
require 'json'

class RecycleBin

	def data
		url = "http://data.cityofnewyork.us/resource/sxx4-xhzg.json"
		response = open(url).read
		data = JSON.parse
	end

	def puts_each_address
		data.each do |bin_hash|
			puts bin_hash["address"]
		end
	end

end
```
## Conclusion/So What?
You now have the tools to build out a Ruby wrapper for any API that you want. The power of open data is at your fingertips. 

## Hints/Hurdles

+ The easiest way to play around with this API is from the command line, but let students know we could drop this model into a Sinatra app and it would function the same way. 
+ Give students some time at the end of the lecture to explore the other API materials on Learn. 



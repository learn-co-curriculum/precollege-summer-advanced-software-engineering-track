#URL Parameters - Full Lecture

##Objective

*Understand URL parameters and manipulate them*

##SWBATs
+ Identify URL parameters
+ Understand how URL parameters are transfered to the backend
+ Manipulate params

### Motivation / Why Should You Care?
Major search engines use URL parameters to complete tasks. Google takes a searched value for penguins and displays it in the url. Google can store searched values in variables and do something with them in the backend to display search results. You can now do that too!

### Lesson Plan

**URL Parameters**

+ A URL parameter is a variable whose values are set dynamically in a page's URL, and can be accessed by its template (your view) and its data sources (your models). It's a very similar concept to a dynamic url.
+ When you search for a value the word you searched for will appear in the URL and will be stored in a variable.
+ In order for a search engine to actually take the variable and display search results, it has to be able to do something with it in the backend.

**Params**

+ When a URL parameter gets to the backend, it's transformed into a hash named params.
+ The variable that stores a searched value in the url becomes a key in the params hash.
  + For example if you had a variable `q` and the search value `penquins`, params would look like:
    ```ruby
      params = {:q => "penguins"}
    ```å
  + Now you could access `penguins`
    ```ruby
      params[:q]
    ```

**Let's Practice!**
***Teacher should display example code to the entire class***

```ruby
  require 'rubygems'
  require 'sinatra'

  get '/hello' do
    "hey there #{params[:name]}"
  end
```
+ What if we modify our routes so that we no longer have `/:name` in our route?
  + How can we have any params to pass to our views? 
  + We don't have a place for a user to enter any input.
+ A url parameter is still a dynamic component of a url. 
+ If we want to print `hey there victoria` in our view, we can't just type localhost:hello/victoria.
  + The key to the hash (:name) is referenced in the params hash, but it is not set up in the route.
+ We could try something like this: `localhost:hello?name=vanessa`. 
  + The question mark indicates that url parameters will be passed in. 

**Challenge**

+ Boot up your localhost and run the practice code. Use your browser to try out the get request. Say hello to yourself. Say hello to someone else. Get crazy.
+ Create another get request in your controller with a different kind of parameter and message, then try it out in the browser.

### Conclusion / So What?
+ URL Parameters are another useful way for receiving and manipulating user input in the backend.
+ Companies like Google use URL parameters to display search results

### Hints and Hurdles
+ Don't forget that a question mark indicates that url parameters will be passed into a url when routes are modified

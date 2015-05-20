#DAY-02 Forms
_A full lecture is available [here](LECTURE.md)_

##Objective
***Incorporate forms into a Sinatra application in order to create and post new tweets.***

### Motivation / Why Should You Care?
How does Twitter post your tweets? How does facebook upload your photos? How does tumblr air your most secret guilty pleasures? All of these web applications take in information from a user, mutate that information, and then display it back. The concept of input-output drives every app in existence. We’re going to teach you guys how to do this with forms.


### Lesson Plan
***This lesson will be using the Fwitter Project Code for completed today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-ruby-sinatra-template/tree/week-2)***

***Code Snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-2-code-snippets)***


**HTML Forms**

+ In `app/views/tweet.erb`:

```html
  <form action="/tweet" method="POST">
    <p>Username: <input type="text" name="username"></p>
    <p>Status: <input type="text" name="status"></p>
    <input class="btn btn-primary" type="submit">
  </form>
```

  * `form` tag - Opening and closing form tag marks the block of code that will make out the form.
    * `action` attribute - tells us what route processes the information the user enters in the form
    * `method` attribute - tells us what type of HTTP request is processing this information. It's always a post.
  * `input` tag marks where we expect a user to enter information
    * `type` attribte - what type of input (text, radio button, check boxes, etc)
    * `name` attribute - this becomes the label for the information that gets passed to the route in the controller. The value that this attribute stores (in this case status) becomes the key in the params hash
    * `type="button"` - this becomes the submit button to submit the form

+ In `application_controller.rb`: we need to set up a route for our app to receive information from a user.

```ruby
  post '/tweet' do
    Tweet.new(params[:username], params[:status])
    redirect '/'
  end
```
 * We set up a post route to to `/tweets` to process the information from the form.
 * The information from the form is sent to the controller as a hash:
 ```ruby
  params = {:username = "Victoria",
            :status => "I love Flatiron!"
          }
  ```
  * We use the information from that hash to create a new instance of our tweet class
  * We then redirect back to the home page `/`

### Conclusion / So What?
Forms are literally the tool that powers user interaction. It is the only way that the web applications we use could operate.

### Hints and Hurdles
+ Tell students it's okay if they don't totally understand how the form info gets turned into a params hash
  * As a newbie there are just some things that you have to take for granted
+ Take time to review Ruby fundamentals with the ToDo - it is important
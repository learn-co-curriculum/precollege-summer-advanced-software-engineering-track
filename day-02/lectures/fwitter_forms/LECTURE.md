#Forms - Full Lecture

##Objective
***Incorporate forms into a Sinatra application in order to create and post new tweets.***

##SWBATs

+ FORMS - Explain how data is passed between webpages via URL params
+ FORMS - Build HTML form with form tags, input tags and submit button
+ FORMS - Understand the importance of form tags and the submit button
+ FORMS - Understand how type and name in the input tag work
+ FORMS - Set up a form with a POST method and action (connecting to route)
+ FORMS - Understand why we use the POST method in forms (as opposed to GETS)
+ CONTROLLERS - Set up a controller with the appropriate actions to process info from a form


### Motivation / Why Should You Care?
How does Twitter post your tweets? How does facebook upload your photos? How does tumblr air your most secret guilty pleasures? All of these web applications take in information from a user, mutate that information, and then display it back. We’re going to teach you guys how to do this with forms.


### Lesson Plan
***This lesson will be using the Fwitter Project Code for completed today can be found [here](https://github.com/learn-co-curriculum/hs-advanced-software-engineering-fwitter-project/tree/day02-forms)***

***Code Snippets can be found [here](https://github.com/learn-co-curriculum/hs-week-2-code-snippets)***

+ **HTML Form:**
  * In `app/views/tweet.erb`, create a new erb file in the public directory called `tweet.erb` in the views directory.
    * See Code Snippet 1
    * Action attribute of the form tag: tells the form where to send the information the user fills out to be processed
    * To look at this form in the browser, we need to set up a new route for the form to be viewed on a new page
      * New get request with `'/tweet'` as the route and have it load `tweet.erb` as the view
      * See Code Snippet 2
    * Now we need to deal with how the information gets sent to the serve. We want this to be processed by the `/tweet` route - but a POST request - a user is posting information to our application to process (`action="/tweet"`)
    * Method attribute of the form tag tells us what sort of HTTP request the form is making. We're giving our server data, so it's a POST request. (`method="post"`)
  * In `application_controller.rb`: we need to set up a route for our app to receive information from a user.
    * See code snippet 3

+ **Form Input**
  * To create the boxes for a user to type using HTML `input` tags. Every separate piece of information will need its own input tags. We'll be taking in username and tweet text.
  * Type attribute: lots of options (text, drop down menu, radio button, check box). We're going to use text (`type="text"`)
  * Name attribute: this is a label for what type of information the user uses (`name="username"` or `name="status"`)
  * Submit button: create with input tags with `type="submit"`
  *See Code Snippet 4

+ **Submitting The Form**
  * When we click submit, app tells us that Sinatra doesn't know the ditty, we need to tell our POST reoute how to process the information
  * Params Hash: When the user submits the form, the information gets passed to the controller as a hash called `params`.
    * If I filled out the form with FlatironSchool as my username and "I <3 coding" as my status, the hash would look like this:
    ```ruby
    params = { :username => "Flatiron School",
                :status => "I <3 Coding"
            }
    ````
    * The keys of the hash come from the value of the `name` attribute in the input tag. Each value in the hash is whatever input the user entered
    * [This](: https://drive.google.com/a/flatironschool.com/file/d/0B4vrcPO5UdhRSUhNMnpuY2hRYU0/view) is helpful
    * See Code Snippet 5: You can look at the params hash by either putting a `binding.pry` in POST route or using `puts params`

+ **Processing Info From The Form**
  * We need to use the info from the form to create a new instance of the Tweet class.
  * The POST `'/tweet'` method is the only area of our code that has access to params, so that's where we make our new instances
  * We redirect back to `'/'` here so that all the tweets can get displayed in the main page.x
  * See Code Snippet 6

### Conclusion / So What?
Forms are literally the tool that powers user interaction. It is the only way that the web applications we use could operate.

### Hints and Hurdles
+ Tell students it's okay if they don't totally understand how the form info gets turned into a params hash
  * As a newbie there are just some things that you have to take for granted
+ Take time to review Ruby fundamentals with the ToDo - it is important
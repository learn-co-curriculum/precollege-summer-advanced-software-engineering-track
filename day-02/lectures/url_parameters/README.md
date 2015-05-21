#DAY-02 URL Parameters

_A full lecture is available [here](LECTURE.md)_

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

**Params**
+ When a URL parameter gets to the backend, it's transformed into a hash named params.
+ The variable that stores a searched value in the url becomes a key in the params hash.


**Challenge**
+ Boot up your localhost and run the practice code. Use your browser to try out the get request. Say hello to yourself. Say hello to someone else.
+ Create another get request in your controller with a different kind of parameter and message, then try it out in the browser.

### Conclusion / So What?
+ URL Parameters are another useful way for receiving and manipulating user input in the backend.
+ Companies like Google use URL parameters to display search results

### Hints and Hurdles
+ Don't forget that a question mark indicates that url parameters will be passed into a url when routes are modified

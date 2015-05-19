### Motivation / Why Should You Care?
You guys have learned A TON in the past 5 classes - MVC, forms, databases, user sessions. SO MUCH. It’s a lot to hold in your head at once, but luckily you don’t have to do that! Part of becoming a good developer is just practicing as much as possible - by building things - and getting good at knowing where to look stuff up. We are going to give you guys all day today to practice what you’ve learned so far by building a project from the ground up - the Flinstagram!! Before we get started there, we're going to build a ToDo List app together.

### Lesson Plan
+ **Step 1.** The M.
  Start off with one model/table for List with the following attributes/columns:
  ```ruby
  :name
  ```
  * Set up an List class in `list.rb` (don't forget to inherit from from ActiveRecord::Base) and create a migration for the items table `rake db:create_migration NAME="create_lists"`. Fill in your `up` and `down` methods in the migration file then run it with `rake db:migrate`.
+ **Step 2** Lists need to be able to have items. Let's build out an Item class `models/item.rb`. The class should inherit from `ActiveRecord::Base`. We also need a table in the databse for items `rake db:create_migration NAME="create_items"`. Items should belong_to a list and a list has_many items. That means that the item table needs a `list_id` column. This column should be an integer.
+ **Step 3** Onto the V.
  * Create an `index.erb` file. This file needs a form to create a list. 
+ **Step 4**
  * Set up your `post '/list'` route to create a new list based on the params from the form in `index.erb`. This route should create a new list and save it to the database. (`List.create`...)
+ **Step 5**
  * We want to be able to view all of our lists. The `index.erb` page should also have a form with a drop down of all the already created lists using the html `select` tag. Once you select a list, it should direct you to a page that displays all the items. This form should pass the `list_id` as the params
+ **Step 6**
  * We need a `post '/view_list'` route for our form to view a list. This action should use the ActiveRecord `find_by` method to retrieve the list from the database. The last line of this action should be `erb :view_list`.
+ **Step 7**
  * We need to create a `view_list.erb` file to view the list. This file should iterate over all the items on the list.
+ **Step 8**
  * Now we need to be able to add Items to a list in order to view anything. We need to create a new view called `list.erb`. 
  * This view needs to contain a form where we select a list, and then enter what item we want to add to it. This form params need to contain the list_id (necessary information for creating a new item)
  * This method should post to a new route `'/add_item'`
+ **Step 9**
  * Now we need a new action in our controller, `post '/add_item'`. This action should take the params from our form in `list.erb` and call `Item.create` using the information from the form from the form params.
+ **Step 10**
  * We need users to be able to access the add item list, so we need to link it from our `view_list.erb` file.


### Conclusion / So What?
You know so much! And being able to build this project on your own from the ground up is proof.

### Hints and Hurdles
+ Encourage students to go back and look at how they built Fwitter - pattern matching is key!
+ Be there for support but encourage students to help each other, Google, etc. before they ask you for help.

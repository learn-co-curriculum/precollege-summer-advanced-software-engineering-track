### Motivation / Why Should You Care?
You guys have learned A TON in the past 5 classes - MVC, forms, databases, user sessions. SO MUCH. It’s a lot to hold in your head at once, but luckily you don’t have to do that! Part of becoming a good developer is just practicing as much as possible - by building things - and getting good at knowing where to look stuff up. We are going to give you guys all day today to practice what you’ve learned so far by building a project from the ground up - the Flatiron Swag Shop!

### Lesson Plan
+ **Step 1.** The M.
  Start off with one model/table for Items with the following attributes/columns:
  ```ruby
  :name
  :image_url
  :price
  :count
  ```
  * Set up an Item class in `item.rb` (don't forget to inherit from from ActiveRecord::Base) and create a migration for the items table `rake db:create_migration NAME="create_items"`. Fill in your `up` and `down` methods in the migration file then run it with `rake db:migrate`.
+ **Step 2.** Add to the database!
  * Boot up `tux` in your terminal and create some new items. L
  * There are links to images that students can use in the lab on Learn.co
+ **Step 3** Onto the V.
  * Create an `items.erb` file that will display all of the merch for our store - including each item's name, photo and price.
+ **Step 4**
  * Set up your `get '/items'` route to pull all of your items from the database and display them in your new `items.erb` template.
+ Challenges (in the project README)
  * Set up a form that lists all the items and allows visitors to chose how many of each item they would like to order.
  * Add an inventory page that displays the count for each item.
    * Set up a form on the inventory page that lets you increase the inventory for any item. When the form is submitted, the items' inventory (count) should increase.
  * Set up a User model (with attributes for name and email) and a sign up page.
  * Set up a Purchase model that will track user's purchases.
    * This table will have two columns - user_id and item_id. Tables like this are called join tables because they connect (or join) objects from other models/tables.
    * You'll also need to set up new ActiveRecord relationships for each model. The Purchase model `belongs_to` users and items. The User and Item models both `has_many` purchases. This may seem a little strange but just roll with it.

[Lab](https://github.com/learn-co-curriculum/hs-flatiron-swag-store-for-real)


### Conclusion / So What?
You know so much! And being able to build this project on your own from the ground up is proof.

### Hints and Hurdles
+ Encourage students to go back and look at how they built Fwitter - pattern matching is key!
+ Be there for support but encourage students to help each other, Google, etc. before they ask you for help.

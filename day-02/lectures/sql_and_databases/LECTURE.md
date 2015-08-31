#Databases - Full Lecture

##Objective

***Learn to use SQL, a popular database language, and how it relates to our web applications  ***

## SWBATs

+ DATABASES - Explain why databases are important 
+ DATABASES - Describe the structure of a database
+ SQL - Create and modify tables and access info from tables via SQL queries
+ SQL - Learn the proper SQL queries to Create, Read, Update, and Destroy (CRUD) rows in our tables

## Motivation / Why Should You Care?
The way that we use the internet would be vastly different if we couldn’t save our data. You wouldn’t be able to have sites like facebook, tumblr, yelp or pretty much anything. Databases make all of these applications possible. They are the backbone of the web. We’re going to learn how to persist (save) data so that it is accessible from different places at different times.

## Lesson Plan
**BEFORE CLASS: DOWNLOAD CHROME MYSQL ADMIN** You can find the guide for downloading and using MYSQL [here](https://github.com/learn-co-curriculum/hs-ruby2-teachers-guide-mysql-setup)

+ **WHAT IS A DATABASE**
  * A relational database is essentially a series of tables that can be joined to one another.Each table is like an excel spreadsheet.
  *  A school may have a database with two tables one for students and another for grades. To link these two files, each student is assigned a unique identification number, which appears in both the personal information file and the grades file.

+ **SQL**
	* SQL is the language that controls databases (how you create and name tables, add information, add, delete, modify, and read information)
	* As we learn SQL, you'll notice some similarities to other languages we've learned, and also some differences. 
  * **Class should go to Chrome Webstore and download [MySQL Console](https://chrome.google.com/webstore/detail/mysql-console/cakepohgdbjbenkcpkkacmohgfjhnjoh?utm_source=chrome-ntp-icon)**
    * Open up MYSQL Console and log in by typing `login [host] [port] [username] [password]` where
      * host is 45.55.161.130
      * port is 3306
      * username is flatiron
      * contact Danny or Ian for PW
    * Use CMD + ENTER to run lines of code in the console
    * Type `USE software_engineering` to use the shared database.
    * We now have access to the software enginnering database, where we'll be able to add, modify, delete, and read from tables. We can also create our own tables.

* Creating a table:
    * Students do this and create their own table names
    * Example for tweets:
  ```sql
    CREATE TABLE tweets (id integer auto_increment primary key, user VARCHAR(50), status VARCHAR(140)); 
  ```
    * `CREATE TABLE tweets`: We're actually creating the table in our databse called tweets
    * ` id integer auto_increment primary key`: Here we're creating the ID column, and the datatype of the information that will be stored in this table is an integer. `primary key` means it's a unique identifier for each row, and `auto_increment` means that for every new entry in the database, the ID will automatically increase by 1. 
    * `user VARCHAR(50)`: creating the user column with a string datatype. This can only hold 50 characters
    * `status VARCHAR(140)`: creating the status column which holds a string of 140 characters. VARCHAR stands for variable character.
  
  Now that we've create a table, we can use it to store data. There are four basic functions we'll do with our data: Create new rows, Read or Retrieve rows, Update rows, and Delete rows. Programmers often use the acronym "CRUD" to refer to this. Let's look at examples of CRUD in action. 

  * Adding a row (C):
  ```sql
    INSERT INTO tweets (user, status) VALUES (“Danny”, “Hello world!”);
  ```
    * The ID column would get populated with 1 (happens automatically because the table has a primary key)
    * user column gets population with "Danny"
    * status column gets population with "Hello world!"

  * Retrieving a row (R):
  ```sql
    SELECT * FROM tweets 
  ```
    * `*` means we're selecting everything
    * `FROM tweets` means from the tweets table
  * have students enter their own information in the database in a table called `students`
  * `select * from students` pulls all students
  * `select * from students where name="zach"` gives us one record if there is a match
  * `SELECT * FROM sunday_students WHERE favorite_food = "pizza"` gives all info about all students that like pizza.
  	** Note that in SQL, we use `=` for both assignment and comparison, unlike in Ruby. 
  * ``SELECT name FROM sunday_students WHERE favorite_food = "pizza"` gives us the names of the students who's fav food is pizza

 * Updating a row (U):
  ```sql
    UPDATE tweets SET status="Hello moon!" WHERE id=1;
  ```
    * `UPDATE tweets` means we're updating the tweets table
    * `SET status="Hello moon!"` means we're setting the column status to the value of "Hello moon!"
    * `WHERE id=1` works the same as in our select statement - it specifies where to update the column. Without the WHERE clause, every row in our table would have a status of "Hello moon!"
  * have students change their favorite foods in the  `students` table
  * ``UPDATE students SET favorite_food="coffee" WHERE name="Ian"` changes the favorite food to "coffee" if the name is equal to "Ian"

* DELETING a row (D):
  ```sql
    DELETE FROM tweets WHERE id=1;
  ```
    * `DELETE FROM tweets` means we're modifying deleting something from the tweets table
    * `WHERE id=1` tells us which row to delete. Without this, we'd delete all of the rows. 
    * In general, be VERY careful when deleting data. Once it's gone, it's gone forever. Can you imagine what would happen to an Amazon employee if they typed `DELETE FROM customers;` instead of `DELETE FROM customers WHERE id=2;`

+ Now that we've had some practice, connect to the Chinook database to do the SQL challange. You can change what database we're using by entering the command `USE Chinook;`

## Hints and Hurdles
+ MySQL workbench works on all computers (PC, Mac, Chromebook)
+ If students have trouble connecting, make sure they've pressed CMD+enter instead of just enter. 
+ Make sure they understand how SQL works and test the DB before class
+ There is a very good chance someone will delete the students table, either by accident or otherwise. This is a great teaching moment - ask the students why it's important not to destroy data? 

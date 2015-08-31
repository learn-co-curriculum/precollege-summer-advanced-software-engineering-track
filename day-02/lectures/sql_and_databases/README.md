#DAY-03 SQL and Databases

_A full lecture is available [here](LECTURE.md)

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

+ **SQL:** is the language that controls databases (how you create and name tables, add information, add, delete, modify, and read information)

+ **Class should go to Chrome Webstore and download [MySQL Console](https://chrome.google.com/webstore/detail/mysql-console/cakepohgdbjbenkcpkkacmohgfjhnjoh?utm_source=chrome-ntp-icon)**
    * Open up MYSQL Console and log in by typing `login [host] [port] [username] [password]` where
      * host is 45.55.161.130
      * port is 3306
      * username is flatiron
      * contact Danny or Ian for PW
    * Use CMD + ENTER to run lines of code in the console
    * Type `USE software_engineering` to use the shared database.
    * We now have access to the software enginnering database, where we'll be able to add, modify, delete, and read from tables. We can also create our own tables.
    
  * Creating a table:
  ```sql
    CREATE TABLE tweets (id integer auto_increment primary key, user VARCHAR(50), status VARCHAR(140)); 
  ```
  * Adding a row (adding data):
  ```sql
    INSERT INTO tweets (user, status) VALUES (“Danny”, “Hello world!”);
  ```
  * Read information:
  ```sql
    SELECT * FROM tweets 
  ```
    

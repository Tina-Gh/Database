# Database

My Database (SQL) codes and queries

<br>

## Start on GoormIDE:

1. First create your book_data.sql file with the following code:
<ul>
  <li>DROP DATABASE IF EXISTS book_shop;</li>
  <li>CREATE DATABASE book_shop;</li>
  <li>USE book_shop; </li>
  <li>CREATE TABLE books</li>
  <li></li>
  <li></li> 
  <li></li> 
</ul>

## GoormIDE (Cloud-based):

Creating Databases Code

1. Start the CLI:

mysql-ctl cli; 

2. List available databases:

show databases; 

3. The general command for creating a database:

CREATE DATABASE database_name; 

4. A specific example:

CREATE DATABASE soap_store;

5. To drop a database: (Remember to be careful with this command! Once you drop a database, it's gone!)

DROP DATABASE database_name; 

6. Use your database:

USE database_name;

7. Show the current database:
  
SELECT database();

8. Create table:

CREATE TABLE tablename
  (
    column_name data_type,
    column_name data_type
  );
  
9. Show table info:

SHOW TABLES;
 
SHOW COLUMNS FROM tablename;
 
DESC tablename;

10. Dropping the table:

DROP TABLE table_name;

11. Insert data into the table:

INSERT INTO table_name(column_name) VALUES (data);

12. Combat Warnings in mysql:

SHOW WARNINGS;

The solution is to run the following command in your mysql shell: set sql_mode='';

13. Updating a table:

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

14. Delete data from a table:

DELETE FROM cats WHERE name='Egg';

DELETE FROM cats;

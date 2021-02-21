# Section 3: Creating Databases and Tables

Slides are available at <a href="http://webdev.slides.com/coltsteele/" target="_blank">This link</a>.

<hr>

## 1. Code: Creating Databases

- Start the CLI:

  mysql-ctl cli; 

- List available databases:

  show databases; 

- The general command for creating a database:

  CREATE DATABASE database_name; 

- A specific example:

  CREATE DATABASE soap_store;
  
  
## 2. Code: Dropping Databases

- To drop a database:
  
  DROP DATABASE database_name; 

- example:

  DROP DATABASE hello_world_db; 

  <em>!: Remember to be careful with this command! Once you drop a database, it's gone!</em>


## 3. Code: Using Databases

- To use a database:

  USE [database name];
 
  SELECT database();
  
- example:

  USE dog_walking_app;
 
  SELECT database();


## 4. Create Tables:

- Create table:

  CREATE TABLE tablename
  
  (
  
    column_name data_type,
    
    column_name data_type
    
  );

- Example:

  CREATE TABLE cats
  
  (
  
    name VARCHAR(100),
    
    age INT
    
  );


## 5. Show Tables: 
 
- SHOW TABLES;

- SHOW COLUMNS FROM tablename;
 
- DESC tablename;


## 6. Dropping Tables:

- DROP TABLE <tablename>; 

- A specific example:

  DROP TABLE cats; 

<em>!: Be careful with this command!</em>


## 7. Inserting Data:

- The "formula":

  INSERT INTO table_name(column_name) VALUES (data);

- For example:

  INSERT INTO cats(name, age) VALUES ('Jetson', 7);
  
  
  ## 8. Select:
  
 - The "query":
  
  SELECT * FROM cats; 

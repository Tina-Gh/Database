# Section 3: Creating Databases and Tables

Slides are available at <a href="http://webdev.slides.com/coltsteele/mysql-97-98#/2" target="_blank">This link</a>.

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

  USE <database name>;
 
- example:

  USE dog_walking_app;
 
  SELECT database();

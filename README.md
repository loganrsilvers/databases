## Dog Breed Database Project - README
This project involves a relational database designed to store, manage, and query detailed information about dog breeds, their characteristics, group classification, and demeanor. It consists of:

* Database schema and sample data for the AKCDOGS database

* SQL query exercises for extracting information from this data

* Sample update and retrieval queries using MongoDB-like syntax

## File Summaries
### DogBreed_DB_LS.sql
* Purpose: Provides the SQL statements to create and populate the akcdogs database.
* Contents: Schema definitions for tables: breeds, demeanor, groups
* Definitions include primary/foreign keys and fields such as breed name, weight, height, life expectancy, group, and demeanor classification
* Data insertion for all tables, representing hundreds of dog breeds and their attributes
* Usage: Use this script to create the database foundation and seed it with sample data for both schema demonstrations and query practice.​

### DogBreed_Queries_LS.sql
Purpose: Contains a set of SQL queries intended as exercises for database querying skills.
* Contents: Multiple queries covering:
* Selection of suitable watch dogs (AlertResponsive demeanor, min weight criteria)
* Breeds in the herding group that are not good watchdogs
* Extracting additional attributes such as life expectancy alongside previous filters
* Finding breeds with the greatest life span, limited by number or group (e.g., top 10 terriers)
* A personalized search for a favorite breed
* Queries use advanced SELECT techniques with JOINs, filtering, ORDER BY, and LIMIT clauses
* Usage: Run against the AKCDOGS database after setup for learning and assessment on querying with multiple joins, filtering, and ordering.​

### UpdateData_Queries_LS.txt
* Purpose: Presents data retrieval and update tasks in a MongoDB-like query syntax.
* Contents: Find and filter documents based on field criteria (e.g., by process, data source, or wind speed)
* Insert a new document for a test case, verify insertion, and subsequently delete the test entry
* Usage: Practice data addition, verification, and cleanup as well as filtering in a document-based context, supplementing the SQL focus of other files.​

## Usage Workflow
### Set up the Database
* Execute DogBreed_DB_LS.sql in a compatible SQL environment (such as MariaDB or MySQL) to create and populate the base tables.
### Query the Database
* Use the exercises in DogBreed_Queries_LS.sql to reinforce SELECT query skills with real-world search scenarios.
### Practice NoSQL Updates
* Use the operations in UpdateData_Queries_LS.txt (with MongoDB or similar) for hands-on practice with document-oriented data manipulation.

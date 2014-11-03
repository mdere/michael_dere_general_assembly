# Domain Modeling and Databases

## Learning Objectives

* Describe the basic parts of an ERD
* Construct ERDs to model the nouns and relationships in a domain
* Explain what a database is and why you would use one as opposed to other
  persistent storage mechanisms
* Explain the difference between a database management system (R/DBMS) and a
  database, and name the major DBMSes
* Convert an ERD into a DB schema and load it into SQLite3

## Framing (5 minutes)

Mention no slides today, but I can provide brief notes / resources if desired.

We've been working with objects for a bit now, and can see some of the benefits.
**What are those benefits?**

### Think-Pair-Share (30 sec + 2 minutes + 2 minutes)

What problems do we still have working with object? In other words, what's
missing? What happens when our program quits?


While objects and OOP are great, we don't have a way to save our objects, do we?

**What happens when our program quits?**

Even if we could save our objects, how do we 'find' them?

By the end of today, we should have a solution to these problems using
ActiveRecord, which is a major component of Rails. ActiveRecord uses a database
to store our objects even when our program quits.

We can use it to create, retrieve, modify, and delete objects.

To get there, we need to talk about four topics:
* Domain modeling
* Databases
* Gems
* Active Record Basics


## Domain Modeling

### Background - What is domain modeling? (5 minutes)
**I do**

* When talking about a problem, we often think of things in terms of nouns and
  verbs.
* The verbs are really methods in our code (so they are 'saved there')
* The nouns are the objects in our program.

Often what we can do in our code is dictated by what our objects look like and
how they relate to each other. So it's good practice to think through what
types objects are in our program, and what attributes they have.

One tool we have for doing this is called an ERD. ERDs only capture the nouns,
their attributes (instance variables), and their relationships, NOT the verbs.


### Class Exercise - Modeling a Library (10 minutes)
**We do**

Work with students to model a library. List the sorts of nouns that we need to
include.

As we build the ERD, talk about the concept of relationships (one-one, one-many,
many-many)

Eg:
* Books
* Authors
* Patrons
* Shelves
* Employees

Once we're done, highlight the section of the ERD that we'll be working with for
today (books and authors).

### Group Exercise - Modeling the class (5 minutes + 10 minutes to present)
(3 ppl / group)
**You do**

In groups of 3, choose a problem you're interested in and construct an ERD. Your
ERD should have at least 3 models, and appropriate relationships and attributes.

Give each group 2 minutes to explain their ERD to the class.

## BREAK (5 minutes)


## Intro to Databases

### Background - Why DBs (5 minutes)
**I DO**
So we have these ERDs / models for our objects. They only describe the general
attributes. When we create instances, that's where the actual 'data' is.

We need a way to store that data. How can we do that?
**Ask class for a few ways to store data**

It turns out that DBs are generally a good solution to solve this problem, why?

* Fast
* Efficient
* Very reliable
* Adaptable
* Lots of features ('querying', consistency, GIS, etc)

### What is a DB? (10 minutes)

A set of tables, where each table has a structure (columns), and the data
(rows).

If you've ever used a spreadsheet, DBs are like really advanced spreadsheets.

Demonstrate by drawing the table(s) from the library db on the whiteboard.

### DB Software (5 minutes)

It's important to mention that there are lots of different database tools.
Common ones include:

* MySQL
* PostgreSQL
* SQLite
* MS SQL Server

Each one has some pros/cons, and features, etc, but they all share something in
common (SQL - Structured Query Language). These are often called 'Relational DBs'

**Why is the 'relational' important?**
Consider the R in ERD...

We'll be using SQLite3 because it's easy to set up, but much of what we'll learn
will transfer to other SQL DBs.

There are other types of DBs that differ in fundamental approach, such as the
new NoSQL DBs (e.g. MongoDB, Cassandra, Redis)

### Creating a DB (5 minutes)

Demonstrate by creating a simple database, e.g. pokeman:

sqlite3 pokedex

Write the following schema and use Use .read pokemon_schema.sql to read load it in.

```sql
CREATE TABLE pokemon (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  hp INTEGER
);
```

Describe the different datatypes and why we have to define them in advance.
Describe the purpose of a primary key and auto-increment.


### Group Exercise - Write the schema for Library (10 minutes)
**YOU DO**
In groups of 2, create a file folder called `my_library`.
In that folder create a file called `schema.sql`.
In that file, create the necessary CREATE statements to create the books and authors
table from our example.

Provide students with the seed.sql file and have them load it into their DB.

### Wrap Up - Quick demo of SQL (5 minutes)

Frame that we're not going to really be using SQL in this class, instead we'll
use ActiveRecord to abstract away the DB / SQL.

Demonstrate using SELECT to find records. Demonstrate a JOIN to show how SQL can
handle relationships.

### BREAK (10 minutes)

Should be 8pm at this point!

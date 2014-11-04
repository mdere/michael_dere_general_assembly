# ActiveRecord Basics

## Learning Objectives

* Explain what an ORM is and why ORMs are useful
* Explain convention-over-configuration, and how it relates to ActiveRecord
* Utilize ActiveRecord to perform CRUD actions on a database
  * create
  * all
  * find, find_by
  * where
  * update
  * save
  * destroy
* Utilize ActiveRecord associations to implement relationships between ruby
objects.

## Framing (5 minutes)

At this point, we have our data models, and we know how to structure a DB to
store the data for the instances of a model.

But we don't have a way to actually load those models in our ruby programs. That
is, there is no interface between the database and ruby. We could write our own,
but thankfully this is a common problem that has many solutions. These solutions
are called ORMs (object relational mappers).

ActiveRecord is one ORM, and a popular one, since it's the standard choice for
Rails apps. (It's part of rails.)

ORMs allow us to store objects as rows in a DB table, and to create / retrive /
update / destroy them using ruby methods. These are called the CRUD actions.

## Setting Up ActiveRecord - Code-Along

Our plan for using ActiveRecord is to:

1. Install the 'activerecord' and 'sqlite3' gems.
2. In our ruby program, require both 'active_record' and 'sqlite3'
3. Tell AR how to connect to our database.
4. Define our ActiveRecord models (classes)
5. Setup pry so we can perform CRUD actions

## Getting all Books

Demonstrate how we can use the Book model to retrieve info from the database.

```ruby
Book.all
```

## Creating Books

Demonstrate how AR models act just like normal models, but get the getter and
setters for 'free'.

```ruby
Book.all.size
Book.all
my_book = Book.new()
my_book.title = "A BEWDiful Approach to ActiveRecord"
my_book.publication_date = 2014
```

Discuss the difference between class methods and instance methods in the context
of AR. **Start a list on the whiteboard**

### Quick Exercise - Creating

1. Create 1 book (just set the title and publication_date).
2. Quit your app and restart it
3. Check if your book is in the list.
4. Create another book in a variable called ('my_favorite_book') and then call `.save` on that book.
5. Restart your app and see if the book is still there.

What did we observe?

## Creating with Hashes

If we pass in a hash to `.new`, it will pre-populte the properties of the instance
from the hash.

```ruby
my_other_book = Book.new({title: "Cats: A Picture Book", publication_date: 2009 })
my_other_book.save
```

### Quick Exercise - .new vs .create

Use the Rails Guides on AR to look up the difference between `.new` and `.create`.

Use `.create` to create a book.

## Finding Books

Demonstrate .where and .find

```ruby
Book.find(1)
Book.find(2)
Book.find(9001)

Book.where(publication_date: 1998)
Book.where(publication_date: 2014)
```

## Updating Books

```ruby
my_book = Book.last
my_book.publication_date = 1989
my_book.save

my_book.update({publication_date: 2013})
```

## Destroying Books

```ruby
my_book.destroy
```

## Recap

What's important here:
* Table name matches model name (but plural)
* columns map to attributes (getters and setters)
* we can Create, Read, Update, and Destroy, but don't forget to save when appropriate

### Exercise - Authors

1. Define the author model so we can use it with ActiveRecord
2. Find all authors
3. Find out how many authors there are
4. Find the author born in 1929
5. Find all authors born before 1900 (we didn't cover this, look it up!)
6. Create a new author entry for yourself and save it. Do it without using hashes.
7. Destroy that author entry.
8. Create it again, but this time using hashes.
9. Define a method for authors called 'info' that returns a string e.g.
    "Milan Kundera from Czechoslovakia born in 1929"

## Refactoring

Refactor code to move models into a models folder and require them as appropriate.

## Associations

**What is the nature of associations between authors and books?**

Modify books to `belongs_to :author`.

Demonstrate the methods that we get on books:

```ruby
# getter
some_book.author
some_book.author_id

# setter
some_book.author = an_author
some_book.author_id = an_author_id
```

Have students try to do some_author.books. What's missing?
`has_many :books`

## Exercise - Using associations

1) Create 1 new book and save it
2) Associate that book by setting it's author to be any of the existing authors and save it.
3) Change the author to be another one (save it)
4) Find that author and then see what his books are.

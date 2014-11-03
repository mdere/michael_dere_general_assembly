# Ruby Gems

## Learning Objectives

* Use RubyGems to install, list, and uninstall 3rd-party libraries
* Use `require` to load a gem into your own program
* Explain the difference between `require` and `require_relative`
* List at least 3 factors to consider when evaluating a ruby gem

## Framing

There are many times where we're faced with a problem that is fairly common.
Thankfully we live in a world where lots of nice people want to share their
solutions to these common problems (i.e. code).

### Turn and Talk (2 minutes + 2 minutes) - problems w/ sharing code

In groups of two, take 2 minutes to discuss the following question:

**What are some problems that we might face when using other people's code?**

Some possible answers:
* Downloading the code
* Loading it into our project
* Dealing with updates / versions
* Using the same code in multiple problems
* Dependancies

### Jot Pair Share - Pick a problem and propose solutions

Pick one of these problems with a partner, Take 2 minutes to think about how you
might solve it, and then take 2 minutes to talk with your partner about your ideas.

## Concepts of Ruby Gems

Whiteboard the following:

### What is a gem?

A gem is just a bunch of code that someone wrote, and then 'published' by
packing it up and sharing it. The packing involves structuring the code and
writing up a description so that rubygems can understand the code.

### How do we use them?

Introduce RubyGems. RubyGems solves most of these problems:
* It includes a `gem`, a command which allows us to manage our gems from
  * download / install gems
  * list the gems (and versions)
  * update versions of gems
  * manage multiple versions
* It can load a gem's code into our own:
  * if we `require` a file, and it's not already in our $LOAD_PATH, then RubyGems
    will search for that file in our list of install gems.
  * this works because rubygems and ruby are built together

## Using RubyGems

Motivation: Show how IRB output sucks for arrays and hashes.
Create an array, and a 'me' hash:

```ruby
 me = {:name=>"adam", :last=>"bray", :email=>"adam.bray@ga.co", :interests=>["long walks on the beach", "kittens playing with string", "scandinavian heavy metal"]}
```


### Using a Gem - Code-Along

Install the awesome_print gem.

* Demonstrate how to require the gem, and show that it works.
* Demonstrate how $LOAD_PATH changes.

## Resources

### Gems
* [How Do Gems Work?](http://www.justinweiss.com/blog/2014/09/29/how-do-gems-work/)

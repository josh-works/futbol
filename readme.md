## Rebuilding Turing's Futbol Project

I've now worked with a number of Turing students on the [futbol](https://backend.turing.io/module1/projects/futbol/index) project.

There's a few consistent spots that they tend to get stuck on, but I'm not familiar enough with the right solution to guide them to it.

Also, I've always enjoyed re-writing Turing projects. They usually take a tiny fraction of the time they took me in Turing, and I gain an appreciation for design patterns I've read about in books like [Eloquent Ruby by Russ Owens (2011)](https://www.goodreads.com/book/show/9364729-eloquent-ruby?ac=1&from_search=true#) and Sandy Metz' famous [Practical Object-Oriented Design in Ruby](https://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330)

I'm building this resource with several goals and related constraints in mind:

### Goals

- share information in a way that advances the learning of a broad number of people, "beginner" through at least "intermediate".
- advance the related goals I've got described on [intermediateruby.com/about](https://intermediateruby.com/about)
- do this _quickly_. for a variety of reasons, I'm working on "shipping quickly"
- advance the state of current Turing students who avail themselves of this resource, _even if it's while they're doing the Futbol project_
- be accessible enough that someone who isn't even _in_ Turing could follow along, and probably gain some useful knowledge along the way. At minimum they'd get a laugh from at least one or two gifs ahead.
- Be "advanced" enough that someone who's about the level of a Turing grad a few months (or a year) out of Turing will still glean things of value. 
- Exemplify design considerations expressed in the various Ruby books I have lying around.
- Learn some super useful things about exploring in Git how files evolve over time.


### Constraints

- time, current knowledge
- I desire to "follow the path of most value", and I plan on this resource or a related resource to some day convey the kind of learning in a short enough time that people would plausibly spend non-trivial resources to learn more from. 
- I've been typing for 10 minutes and I'm hoping to have at least some of this project done in the next 30 minutes
- My wife and I are pretty busy today. It's also relevant how much income I bring in. I'm a husband, future father, neighbor, homeowner, etc. I've got lots of competing demands on my time, and I hope to not waste _your_ time that you might spend on this resource with me, no matter how you busy you are or are not. 
- I'm open to sinking a dozen-plus hours into this guide (and I'm well on my way to that commitment) as long as the result is _world class_. Ideally, resources like this will lead to people like _you_, who work for companies that have external learning budgets, spending your money sponsoring more guides like this: [https://github.com/sponsors/josh-works/](https://github.com/sponsors/josh-works/). (If you dig this guide and don't have access to Other People's Money, consider sponsoring me at $1/mo. It's useful signaling behavior to me, makes it easier for me to rustle up corporate sponsors. Your $1/mo makes it easier for me to get $3k/mo from BIG_SOFTWARE_CORP down the road.)

---------------

_user's guide: this is a guide explaining how I've created Turing's futbal project from scratch. I've never done it before, I'll try to avoid making any leaps, but when I _do_ lose you, please open an issue on this repo expressing as much. If you're not sure what that means, DM me in slack.

# Steps

I'll outline my steps in stream-of-consciousness style, or as minimally-modified stream-of-consciousness as possible, _from absolute scratch_.

I'll include links to specific commits, so you can "follow along" this repo a bit better. I'll be starting from `mkdir futbol` and `git init`.

I use a `today-i-learned` repo, and as I work through the following resources, I'll update it and link to it in various ways.

[https://github.com/josh-works/til/](https://github.com/josh-works/til/)

I would advocate for almost everyone reading these words to use a resource like the above.


## `mkdir` new project folder:

```
mkdir  futbol
cd futbol
atom readme.md
```

This is what I've done for the above. 

When pasting my git commands, I use my _actual terminal commands, aliases included_, because it'll reveal a slightly higher amount of information about how I work and patterns I use. 

If at any point it get in the way of your learning, and I've either not explained it, or not explained it adequately, let me know and I'll clarify.

I'll commit it via:

```
git init
git status
ga .
gc -m "initial commit"
hub create
git lg
```

And the output:

```
* 4b3ca40 - (HEAD -> master) initial commit (2 minutes ago) <Josh Thompson>
```

And you can figure out how to browse to the above commit in the repo (that's a whole sub-skill of itself I could talk about) and view the commit I just made _checks watch_ 3 minutes ago from when I type these words.

The timing doesn't matter a lot, but it matters _at least a little_, in that the way code changes over time tells a story, had a purpose and meaning. 

The _speed_ at which a story unfolds adds meaning to the story, so inasmuch as the time I've spent working on this (and how that might correlate to how quickly you could do ("worse"|"the same"|"better")) has implications. 

I just added the `busy constraint` in commit `c7dc5d4` which adds some context.

I'll also be using screenshots throughout this guide, so I need a location to store the screenshots. _you obviously don't need a screenshot directory_.

![here's how images work](/images/2021-03-02-at-3.45-PM-screenshot.jpg)

And that'll be another commit. Obviously you don't need to be committing like this or anything. I just want to explain every step of my process, so if you check out the specific commits I list in the future, you'll be able to understand all the constituent pieces of what's gone into the application.

`5668ba1`

### Git shortcut digression

I'll be using aliases for git commands. I've got them setup in my ~/.gitconfig, which currently contains:

```
# ~/.gitconfig
# This is Git's per-user configuration file.
[user]
	name = Josh Thompson
	email = thompsonjoshd@gmail.com
[alias]
  co = checkout
  hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
  st = status
  br = branch
	lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
[branch]
	sort=committerdate
[push]
	default = matching
[core]
	editor = atom
	excludesfile = /Users/joshthompson/.gitignore_global
	
	# from https://tekin.co.uk/2020/10/better-git-diff-output-for-ruby-python-elixir-and-more
	attributesfile = /Users/joshthompson/.gitattributes
[color]
	ui = true
[difftool "sourcetree"]
	cmd = opendiff \"$LOCAL\" \"$REMOTE\"
	path = 
[mergetool "sourcetree"]
	cmd = /Applications/Sourcetree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
	trustExitCode = true

[blame]
	# coloring = repeatedLines
	coloring = highlightRecent
```

The above committed in `1f15647`

## Let's set this thing up...

OH! Forgot to mention... I'm about 20 minutes into beginning this project. Most of that time has been writing the above "outline" of everything. After the last commit on march 2, I was out of the house for the evening, having a covid-safe outdoor dinner with some friends in Denver.

The commit logs will show "wall time" that's elapsed as I've completed this project, but I'll be carefully tracking how much time I spend actually _implementing_ this project. So far, we've not really begun any implementation besides setting up an empty git repo, adding a `readme.md`, and a folder for images.

Back to the `futbol` spec, under `iterations`: [https://backend.turing.io/module1/projects/futbol/index](https://backend.turing.io/module1/projects/futbol/index)

- `Iteration 1: Setup and File I/O`

Click the link to `iteration 1`: [https://backend.turing.io/module1/projects/futbol/iterations/file_io](https://backend.turing.io/module1/projects/futbol/iterations/file_io)

The steps are:

1. One team member forks the repository here and adds the other(s) as collaborators.
1. Each of the other team members accepts the invitation to collaborate and then clones the repository.
1. Setup SimpleCov to monitor test coverage along the way.
1. Create a Rakefile that will run each of your test files without having to run them individually. See this lesson plan for more details.

I'll be skipping the Rakefile and Simplecov step for now. If you're following this guide, do the same. Both of those are worth learning, and setting up, but later, not now. 

OK, the `File I/O` section... is so barebones. 

I'm going to take a break from this (because the instructions are junk) and take a tour through... [CSV Exploration](https://backend.turing.io/module1/lessons/csv_exploration)

## A Digression to Turing's "CSV Exploration" lesson

Because `Futbol` throws you into using CSVs, in a rather advanced way, you'll need to scaffold your understanding. This is a hard-to-find tutorial for exploring how to use CSVs in Ruby, and _it is worth every moment of time you spend on it_: [https://backend.turing.io/module1/lessons/csv_exploration](https://backend.turing.io/module1/lessons/csv_exploration)

Honestly, I think this will be useful for me, because there's lots of data processing I want to do for other projects, related to parsing and relating large CSV exports. So, no matter where you are in your Turing Journey, this will serve you well. 

OK, even before CSV exploration, taking a dive into Turing's lesson on class methods, because we'll end up needed this kind of information for the setup of `futbol`, else you'll end up struggling to implement any sort of OO principles.

## A further digression to Turing's Class Methods lesson (which uses CSV data!)

We'll work through [https://backend.turing.io/module1/lessons/class_methods](https://backend.turing.io/module1/lessons/class_methods).

I encourage you to do the same. I'm going to do this work in this repo, just for the sake of easy committing/tracking of progress. I'm working through the `Practical Use, Experimentation` section:

### Getting started: Download Baby Names

I'll use `curl` to download the given file. I don't always remember the exact syntax for `curl` commands, so I'll do `tldr curl` and see that I want to use:

```
mkdir csv_exploration_lesson
curl https://data.cityofnewyork.us/api/views/25th-nujf/rows.csv?accessType=DOWNLOAD -o csv_exploration_lesson/popular_baby_names.csv
```

Commit for the above: `de569db`

### Getting Started: Outline `name.rb`

Per the recommendation, I'll copy/paste the snippet into `name.rb`.

Gosh, their snippet was rough. It's not actually syntactically valid. I had to:

1. comment out all of `initialize`
1. add an `end`
1. add a `pry`
1. add a method call at the bottom
1. I had to rename the file/constant

Now I can run it in ruby with `ruby csv_exploration_lesson/name.rb`. Here's what I've got right now:

```ruby
require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'

  def initialize(data)
    require "pry"; binding.pry
    # @year = 
    # @bio_gender = 
    # @ethnicity = 
    # @name = 
    # @count = 
    # @rank = 
  end

  def self.find_by_name(name)
    rows = CSV.read(@@filename, headers: true)
    result = []
    name = Name.new(rows.first)
    # new code goes here
    
    result
  end
end

Name.find_by_name("josh")
```

commit: `39dda59`

### Task 1: `Add code to the self.find_by_name method, which builds an array of Name objects that match the name column from our CSV data.`

OK, lets do that...

Here's some of the important bit:

```ruby
def self.find_by_name(name)
  rows = CSV.read(@@filename, headers: true)
  result = []
  rows.each do |row|
    result << Name.new(row)
    # Calling the initialize method with each row, creating a new name object
  end
  
  result
end
```

I don't like having to use the current syntax, though. I stuck a pry in the `initialize`, and ran it, and I have to access data like so:

```ruby
> data["Year of Birth"]
=> "2011"
> data["Child's First Name"]
=> "GERALDINE"
>
```

I happen to know that you can call `symbolize_names` when reading a CSV, which makes life much easier. Let's update the `CSV.read` method. I had to hunt around a little bit to find the exact syntax. I tried `symbolize_names: true`, but that didn't work. Found `header_converters: :symbol` in the [CSV docs](https://ruby-doc.org/stdlib-2.7.1/libdoc/csv/rdoc/CSV.html#method-i-header_converters)

```ruby
def self.find_by_name(name)
  rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
  result = []
  rows.each do |row|
    result << Name.new(row)
  end
  
  result
end
```

Now I can access the data like so:

```ruby
> data[:year_of_birth]
=> "2011"
> data[:ethnicity]
=> "HISPANIC"
```

OK, making progress, lets flesh out the `initialize` method, and rerun the whole thing:

current commit: `9c92d5f`

So, we're getting our data to "be built" and it's accessible as `Name` objects. Lets find the ones that match the name we're looking for!

OK, refactored the class a little. I made these changes in a non-sequential order. Examine the changes to the class, see if you can see what happened:

```diff
diff --git a/csv_exploration_lesson/name.rb b/csv_exploration_lesson/name.rb
index ce8b02c..7df7319 100644
--- a/csv_exploration_lesson/name.rb
+++ b/csv_exploration_lesson/name.rb
@@ -9,20 +9,23 @@ def initialize(data)
     @year = data[:year_of_birth]
     @bio_gender = data[:gender]
     @ethnicity = data[:ethnicity]
-    @name = data[:childs_first_name]
+    @name = data[:childs_first_name].downcase
     @count = data[:count]
     @rank = data[:rank]
   end

-  def self.find_by_name(name)
+  def self.find_by_name(name_to_find)
+    name_to_find = name_to_find.downcase
     rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
-    result = []
+    all_names = []
     rows.each do |row|
-      result << Name.new(row)
+      all_names << Name.new(row)
+    end
+    result = all_names.select do |name|
+      name.name == name_to_find
     end
-
     result
   end
 end

-pp Name.find_by_name("josh")
\ No newline at end of file
+pp Name.find_by_name("MATTEO")
```

It's... growing complicated, this particular `find_by_name` method. 

It also works. It finds the names of everyone named `Matteo`, regardless of the capitalization/case of the input. Lets do a little refactor, to move the CSV reading "process" into its own method:

```ruby
require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'
  
  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:childs_first_name].downcase
    @count = data[:count]
    @rank = data[:rank]
  end
  
  def self.all_names
    @all_names ||= load_name_data
  end
  
  def self.load_name_data
    puts "loading name data"
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    rows.map do |row|
      Name.new(row)
    end
  end

  def self.find_by_name(name_to_find)
    name_to_find = name_to_find.downcase
    
    all_names.select do |name|
      name.name == name_to_find
    end
  end
end

pp Name.find_by_name("MATTEO")
```

I'm liking this more. The `find_by_name` method is a bit simpler now, eh? 

Above refactor in commit `ca7fe13`

-------------

I know I'll be needing `all_names` in future methods, so I didn't want to have to keep re-reading the CSV every time I wanted to look at my names. 

This method is possibly surprising to you:

```ruby
def self.all_names
  @all_names ||= load_name_data
end
```
It basically says:

> If `@all_names` is set to anything, return it. If it's not, set it equal to whatever's on the right side of the `||=`. This means `load_name_data` will be called _exactly once_ and never again. `#load_name_data` returns an array of name objects, so once it's called, `all_names` is just "set" to it's return value. The CSV never has to be run again.

This is `memoization`. [Here's a bit more about memoization](http://gavinmiller.io/2013/basics-of-ruby-memoization/)

OK, this completes "challenge 1", and goes probably a bit above-and-beyond.

### Question 2: `how many rows of data can you find for the following names`

We're querying `Ian`, `Megan`, `Sal`, `Omar`, `Riley`, `Hunter`

I added to the bottom of `name.rb` the following:

```ruby

pp "count for Ian"
pp Name.find_by_name("Ian").count

pp "count for Megan"
pp Name.find_by_name("Megan").count

pp "count for Sal"
pp Name.find_by_name("Sal").count

pp "count for Omar"
pp Name.find_by_name("Omar").count

pp "count for Riley"
pp Name.find_by_name("Riley").count

pp "count for Hunter"
pp Name.find_by_name("Hunter").count
```

and when I run it, I get the results:

![counts](/images/2021-03-03-at-9.49 AM-counts.jpg)

Done with question 2. commit: `8b86bda`

### Question 3: `build one alternate copy of self.find_by_name` for finding things on another column, like `find_by_year`


Cool, added the method:

```ruby
def self.find_by_year(year)
  all_names.select do |name|
    name.year == year
  end
end
```

and the "tests":

```ruby

pp "count for 2011"
pp Name.find_by_year("2011").count

pp "count for 2012"
pp Name.find_by_year("2012").count

pp "count for 2013"
pp Name.find_by_year("2013").count

```

(I had to look through the CSV file itself a little to see what the actual available years were.)

I decided to also add a `grouped_by_year` method that returns the year and count of names, like so:

```
$ ruby csv_exploration_lesson/name.rb
"grouped by year"
{"2011"=>5863,
"2012"=>5859,
"2014"=>5865,
"2013"=>5796,
"2017"=>1973,
"2016"=>2063,
"2015"=>2045}
```

Commit: `9ea851a`

By the way, this is rapidly scaffolding up the constituent pieces of what you'll want to use in the `futbol` and `black_thursday` projects. The next few challenges in this lesson are highly applicable.

### Question 4: `self.where({details})`

Wouldn't it be nice to say:

```
Name.where({name: "josh"})
Name.where({year: "2014"})
Name.where({gender: "2014"})
Name.where({rank: 1})
```

You could say "What are the top three most common names?" and answer with:

```ruby
Name.where(rank: 1)
Name.where(rank: 2)
Name.where(rank: 3)
```

Soon we'll ask "What are the top three most common names for girls?" and ask:

```ruby
Name.where(gender: "female", rank: 1)
Name.where(gender: "female", rank: 2)
Name.where(gender: "female", rank: 3)
```
and get the desired results. Let's build these methods.

Phew.

Took a few minutes, and quite a bit of playing around with the code. Here's what I settled on:

```ruby
# skipping this part
  def self.where(query)
    find_by = query.keys.first
    criteria = query[find_by].downcase
    
    all_names.select do |name|
      name.send(find_by) == criteria
    end
  end
# skipping this part

pp "where name = 'geraldine'"
pp Name.where(name: 'geraldine').count
pp "where year = '2014'"
pp Name.where(year: '2014').count
pp "where gender = 'male'"
pp Name.where(bio_gender: 'male').count

pp "top ranked names:"
pp Name.where(rank: "1")

```

There's a lot going on in this method. I mis-labeled some of the attributes that I was searching for, and was getting back errors. (`bio_gender`, not `gender`, for instance.)

Here's the commit. 
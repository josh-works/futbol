# Josh's _excruciatingly detailed_ notes on Turing's "Class Methods" lesson

### The lesson: https://backend.turing.edu/module1/lessons/class_methods

As I started the `Futbol` project, and as _you_ might start it, it'll be important to understand reading CSVs, and how to build up objects and run queries on them.


## Notes/gotchas from others who have worked through this guide 

- [Jason Gong's notes on the lesson](https://gist.github.com/mhpjay422/4fdfb650910b18e82ab7d1731181edf3)

----------------------

Because `Futbol` throws you into using CSVs, in a rather advanced way, you'll need to scaffold your understanding. This is a hard-to-find tutorial for exploring how to use CSVs in Ruby, and _it is worth every moment of time you spend on it_: [https://backend.turing.io/module1/lessons/csv_exploration](https://backend.turing.edu/module1/lessons/class_methods)

Honestly, I think this will be useful for me, because there's lots of data processing I want to do for other projects, related to parsing and relating large CSV exports. So, no matter where you are in your Turing Journey, this will serve you well. 

OK, even before CSV exploration, we're going to take a dive into Turing's [lesson on class methods](https://backend.turing.edu/module1/lessons/class_methods), because we'll end up needed this kind of information for the setup of `futbol`, else you'll end up struggling to implement any sort of OO principles.

## A further digression to Turing's Class Methods lesson (which uses CSV data!)

We'll work through [https://backend.turing.io/module1/lessons/class_methods](https://backend.turing.io/module1/lessons/class_methods).

I encourage you to do the same. I'm going to do this work in this repo, just for the sake of easy committing/tracking of progress. I'm working through the `Practical Use, Experimentation` section:

### Getting started: Download Baby Names

I'll use `curl` to download the given file. I don't always remember the exact syntax for `curl` commands, so I'll do `tldr curl` and see that I want to use:

```
tldr curl 
mkdir csv_exploration_lesson
curl https://data.cityofnewyork.us/api/views/25th-nujf/rows.csv?accessType=DOWNLOAD -o csv_exploration_lesson/popular_baby_names.csv
```

You can also just visit the URL, download the file, and drag the CSV from your downloads folder to some sort of `/data` folder available in this repository.

Commit for the above: `de569db`

[https://github.com/josh-works/futbol/commit/de569db](https://github.com/josh-works/futbol/commit/de569db)

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

finding the listed commits will be left as an exercise to the reader from here on out. To look at a specific commit, navigate to the `/commits` resource for this repo, and append the six character commit sha to the end:

[https://github.com/josh-works/futbol/commit/](https://github.com/josh-works/futbol/commit/)

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
      # look up what the #send method does to understand this line of code
      # and absolutely stick a pry in here to explore it yourself. 
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

Here's the commit: `3d72b76`

Reading ahead, looks like this commit passes items 4, 5, 6, 7

### Question 8: `self.order` returns sorted data

Looks like we'll want to be able to do something like:


```ruby
Name.order( year: :asc)
Name.order( year: :desc)
```

`asc` and `desc` are long-standing programming jargon terms for "ascending" and "descending" order. I often forget which is which, so I'll just punch in `asc` on a query, see if the desired result comes back, if not, I'll flip it to `desc`, try it again, and hope it works. It often does. You should be more methodical than I am and actually think about what "ascending" and "descending" means.

-------------------

Sidebar - I'm now about two hours into this guide from when I sat down this morning. Much of the time has been explaining in detail each step I've taken. 

My goal is, when _you_ have worked through this resource, you'll have a good idea of how to `query collections of data`. We'll use the data/mental models we're building in this lesson quite often in the Futbol project. 

Even I am building up "new" knowledge in working through this lesson. Most of it is coming easily to me, some of this is requiring a little digging around. If you consider yourself to be "struggling" to keep up, don't. Just move slower, find what's complicated, play with the code in pry, experiment with building it up yourself, and if still stuck, DM me or ask in the `#ruby-exercises` channel at Turing. 

-----------------

## 2021-03-04

Picking this up again, day 3 of spending a little time on this lesson. If you're not spending a ton of time exhaustively documenting your own progress through these exercises, I expect you'll move through all of this in a single sitting, or at least a lot fewer hours than I am. 

-----------------

OK, not too bad. I re-used elements from the prior method, and ended up with:

```ruby
def self.order(query)
	sort_by = query.keys.first
	direction = query[sort_by].downcase
	asc_sorted = all_names.sort_by do |name|
		name.send(sort_by)
	end
	asc_sorted.reverse! if direction == :desc
	
	asc_sorted
end
```

I "tested" it with the following, using `:asc` and `:desc` in different ways:

```ruby

pp "Name.order( year: :desc)"
pp Name.order( year: :desc).first
pp Name.order( year: :desc)[2..5]

pp Name.order( year: :desc).last
```

------------

This finishes the non-extension portion of the exercise. I happen to know that the Futbol project will make good use of more extensive queries, so I'm going to keep humming along and finish up all the extensions.

For example, I want to be able to call:

```ruby
Name.where(year: "2011", ethnicity: "asian and pacific islander")
```

and get back all `Name` instances where these conditions apply. 

Let's update the method to handle this...

First, let's think through how this query could work.

Query 1 could collect all 2011 names, and query 2 could grab all names that match on ethnicity.

We'd have something like this:

```ruby
2011_names = Name.where(year: "2011")
=> [Name1, Name2, Name3]
api_names = Name.where(ethnicity: "asian and pacific islander")
=> [Name3, Name4, Name5]
```

Lets say `Name3` is the only name that exists in both sets. We'd want to somehow return just the values that exist in both datasets. This is the "intersection" of these two "sets". Ruby has some handy methods to deal with sets, and values that exist in just one set, the other, or both, or neither.

Basically, we'd be able to do something like:

[... pardon me while I fire up a pry session and kick the tires...]

![set intersection](/images/2021-03-04-at-9.03-AM-set-intersection.jpg)

```ruby
2011_names & api_names
=> [Name3]
```

Suh-weet. We can keep adding `& other_array` to this, by the way, and keep winnowing down the results to only values that exist across all arrays.

Lets build out this method now!

First, we'll update the method to _iterate_ through each submitted query, and re-test that it still works on the "basic" single-query option. Looks like it does. Here's the current diff:

```diff
diff --git a/csv_exploration_lesson/name.rb b/csv_exploration_lesson/name.rb
index 21b42f5..22ebbb2 100644
--- a/csv_exploration_lesson/name.rb
+++ b/csv_exploration_lesson/name.rb
@@ -50,12 +50,17 @@ def self.count_by_year
   end

   def self.where(query)
-    find_by = query.keys.first
-    criteria = query[find_by].downcase
-
-    all_names.select do |name|
-      name.send(find_by) == criteria
+    results = []
+    query.each do |q|
+      find_by = q.first
+      criteria = q.last
+      query_output = all_names.select do |name|
+        name.send(find_by) == criteria
+      end
+      results << [query_output]
     end
+
+    results.flatten
   end
```

I'm testing with:

```ruby

pp "stage 1, making sure Name.where works with 1 param"
pp Name.where(year: "2011").count
pp Name.where(ethnicity: "asian and pacific islander").count


pp "stage 2:"
pp "Name.where(year: '2011', ethnicity: 'asian and pacific islander')"
pp Name.where(year: "2011", ethnicity: "asian and pacific islander").count
pp Name.where(year: "2012", ethnicity: "asian and pacific islander").count
```

OK. This works OK with a single query, but it totally won't work with multiple queries. I'm not doing any set intersection stuff on the `results` array that I'm shoveling the query results into, and `flatten` obviously doesn't move me in that direction.

Here's the output I got:

```shell
$ ruby csv_exploration_lesson/name.rb
"stage 1, making sure Name.where works with 1 param"
5863 # the count of 2011 names
4071 # the count of asian/pacific islander names
"stage 2:"
"Name.where(year: '2011', ethnicity: 'asian and pacific islander')"
9934 # this shows both _added together_, not the intersection of the two
9930
```

Let's figure out how to take an array of arrays (aka, our `results` array) and do set-intersection of the sub-arrays.

I'm thinking of the `results` array like so:
```
results = [[1, 2], [2, 3]]
results[0] & results[1]
=> [2]
```

First, I care of the results array has more than one sub-array:

```ruby

def self.where(query)
	results = []
	query.each do |q|
		find_by = q.first
		criteria = q.last
		query_output = all_names.select do |name|
			name.send(find_by) == criteria
		end
		results << [query_output] # this is wrong, remove the brackets, `select` returns an array, so this was creating a nested array, like:
		# [[[name, name], [name, name, name]]] 
		# instead of what I wanted, which was:
		# [[name, name], [name, name, name]]
	end
	if results.count == 2
		require "pry"; binding.pry # now I'll hit this pry only when `where` is used
		# with multiple queries. Don't worry, I'll refactor later... 
	else
		results.flatten
	end
end
```

Sick. Making progress. Getting the desired results:

```ruby
def self.where(query)
	results = []
	query.each do |q|
		find_by = q.first
		criteria = q.last
		query_output = all_names.select do |name|
			name.send(find_by) == criteria
		end
		results << query_output
	end
	
	if results.count == 2
		results = results[0] & results[1]
	else
		results.flatten!
	end
	
	results
end

# ...

pp "stage 1, making sure Name.where works with 1 param"
pp Name.where(year: "2011").count
pp Name.where(ethnicity: "asian and pacific islander").count


pp "stage 2:"
pp "Name.where(year: '2011', ethnicity: 'asian and pacific islander')"
pp Name.where(year: "2011", ethnicity: "asian and pacific islander").count
pp Name.where(year: "2012", ethnicity: "asian and pacific islander").count
```

Which returns:

```
$ csv_exploration_lesson/name.rb
"stage 1, making sure Name.where works with 1 param"
5863
4071
"stage 2:"
"Name.where(year: '2011', ethnicity: 'asian and pacific islander')"
919
0
```

Let's refactor this a bit. Here's my refactoring "plan":

![not good code](/images/2021-03-04-at-9.25-AM-refactor-plan.jpg)

Commit `717cc9f`

------------------------

Here's the diff of the first refactor:

```diff
diff --git a/csv_exploration_lesson/name.rb b/csv_exploration_lesson/name.rb
index afd6539..9bf4ac3 100644
--- a/csv_exploration_lesson/name.rb
+++ b/csv_exploration_lesson/name.rb
@@ -52,12 +52,7 @@ def self.count_by_year
   def self.where(query)
     results = []
     query.each do |q|
-      find_by = q.first
-      criteria = q.last
-      query_output = all_names.select do |name|
-        name.send(find_by) == criteria
-      end
-      results << query_output
+      results << select_by_query(q)
     end

     if results.count == 2
@@ -69,6 +64,14 @@ def self.where(query)
     results
   end

+  def self.select_by_query(q)
+    find_by = q.first
+    criteria = q.last
+    all_names.select do |name|
+      name.send(find_by) == criteria
+    end
+  end
+
```

I created a `select_by_query` method, and moved the code down there. Now, inside of `query.each` I just make a method call, shoveling the results into my `results` array. 

Next, lets make it work with multiple selections...

OK, now it _seems_ to work with multiple selections. Time to test it. Here's the refactor. `Name#where` is _much_ cleaner now, though I don't love the case statement that I'm using:

![refactor finished](/images/2021-03-04-at-9.37-AM-refactor-finished.jpg)

This isn't... perfect, but it's absolutely good enough, once I test the function of the method a bit more.

![crap data](/images/2021-03-04-at-9.43-AM-bad-data.jpg)

Arg. Crap. The data encoded in 2012 is bad. I searched for `ASIAN AND PACIFIC ISLANDER`, but in 2012 that data is encoded as `ASIAN AND PACI` (line 3902 and beyond) so the query is coming back empty.

Now's a great time to add _another_ feature, which is something akin to "query normalization", or "data normalization". 

I'm going to add a function that "cleans" the data as Ruby reads the CSV, and normalizes it. 

I'll commit what I've got now, in commit `9b7d723`

------------------------

Here's how I'm going to do this:

![refactor on write](/images/2021-03-04-at-9.48-AM-the-refactor-plan.jpg)

OK, this has turned into a bit more code than I'd hoped for. Here's where I'm at right now, for the `standardize_ethnicity` method:

```ruby
require 'active_support/core_ext/string/inflections'

# skipping some stuff

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'
  
  def initialize(data)
    # skipping stuff
    @ethnicity = standardize_ethnicity(data[:ethnicity])
		# skipping stuff
  end
  # 
	def standardize_ethnicity(ethnicity)
		ethnicity = ethnicity.downcase.parameterize(separator: '_').to_sym
		valid_ethnicities = %i[
			black_non_hispanic
			asian_and_pacific_islander
			white_non_hispanic
			hispanic
		]
		
		if valid_ethnicities.include?(ethnicity)
			ethnicity
		else
			raise "Invalid Name Ethnicity: #{ethnicity}"
		end
		# skipping stuff
```

I decided I wanted to parameterize the ethnicity. "WHITE NON HISPANIC" is just a pain to pass around when doing queries. 

I also have some invalid ethnicities, so I need to handle them one-off

Here's where the code is right now: `1da895c`

I have a good way to make sure that ethnicities passed in are validated and converted from a string to a down-cased, parameterized, valid symbol.

Sidebar: I learned about how to require the `parameterize` method - I've used it in Rails, but it's not included in the "bare" ruby class. 

I wrote an explanatory "today-i-learned" about it. Check it out here: [Parameterize Strings](https://github.com/josh-works/til/blob/main/ruby/parameterize-strings-with-active-support.md)

Anyway, now I need to handle the invalid ethnicities. Maybe the only invalid ethnicities are this one:

![errors](/images/2021-03-04-at-10.29 AM-raise-error.jpg)

So I'll fix it: 

![slowly-but-surely](/images/2021-03-04-at-10.32-AM-translating-symbols.jpg)

I'm finding more broken keys when I re-run the code, so I'll fix them all as I find them. Looks like there is a total of three:

![no more errors](/images/2021-03-04-at-10.34-AM-cleaning-ethnicity.jpg)

Phew. Here's the code now: `1c452c6`. I could refactor this, but... I don't really want to. Oh, nevermind, I'll re-name some things. 

I ought to pull the lists into a widely accessible function, so people could still write strings, like `"black non hispanic"` and have the code operate as if they'd given `:black_non_hispanic`.

I renamed some things: `6a09d63`

---------------

Let's re-run the "tests" and see how things look... (but convert the ethnicity values to symbols first)

```ruby
pp "Name.where(year: '2011')"
pp Name.where(year: "2011").count

pp "ethnicity"
pp Name.where(ethnicity: :asian_and_pacific_islander).count


pp "year & ethnicity"
pp "Name.where(year: '2011', ethnicity: :asian_and_pacific_islander)"
pp Name.where(year: "2011", ethnicity: :asian_and_pacific_islander).count

pp "all names"
pp Name.find_by_name("Eduardo")


pp "2012 & api"
pp Name.where(year: "2012", ethnicity: :asian_and_pacific_islander).count

pp "api & 2012"
pp Name.where(ethnicity: :asian_and_pacific_islander, year: "2012").count

pp "hispanic & 2011"
pp Name.where(ethnicity: :hispanic, year: "2011").count

pp "hispanic & 2011 & geraldine"
pp Name.where(ethnicity: :hispanic, year: "2011", name: "geraldine").count

```

Results are... long, but critically, the counts look good:

```
@rank="97",
@year="2015">,
#<Name:0x00007fd299cde290
@bio_gender="male",
@count="21",
@ethnicity=:hispanic,
@name="eduardo",
@rank="80",
@year="2016">]
"2012 & api"
1051
"api & 2012"
1051
"hispanic & 2011"
1846
"hispanic & 2011 & geraldine"
3
```

Look at that _last_ query, in particular. There's only three results. Lets drill into that one:

```ruby

pp ":hispanic & '2011' & 'geraldine'"
pp Name.where(ethnicity: :hispanic, year: "2011", name: "geraldine")
```

Boom. It's perfect:

```
ruby csv_exploration_lesson/name.rb
"hispanic & 2011 & geraldine"
[#<Name:0x00007fc26ca3d988
  @bio_gender="female",
  @count="13",
  @ethnicity=:hispanic,
  @name="geraldine",
  @rank="75",
  @year="2011">,
 #<Name:0x00007fc26e80ed40
  @bio_gender="female",
  @count="13",
  @ethnicity=:hispanic,
  @name="geraldine",
  @rank="75",
  @year="2011">,
 #<Name:0x00007fc26dc9b2b0
  @bio_gender="female",
  @count="13",
  @ethnicity=:hispanic,
  @name="geraldine",
  @rank="75",
  @year="2011">]
```

## `Name#order` with multiple parameters

I'm reading through [How to use sort_by to sort by multiple parameters in Ruby](https://allenan.com/how-to-use-sort_by-to-sort-by-multiple-parameters-in-ruby/). This is a trivial operation in Rails, but I didn't remember off the top of my head how to do it in Ruby.

I assumed `sort_by` could take multiple arguments, but the docs didn't indicate that. Looks like it _can_ take multiple arguments.

This is easy to do. To set it up, open up a pry session here, and in the editor:

```ruby
all_names.sort_by {|n| n.year }.take(5)
=> [#<Name:0x00007fbd79ece008 @bio_gender="male", @count="34", @ethnicity=:white_non_hispanic, @name="victor", @rank="73", @year="2011">,
 #<Name:0x00007fbd79ecf548 @bio_gender="male", @count="41", @ethnicity=:white_non_hispanic, @name="tzvi", @rank="66", @year="2011">,
 #<Name:0x00007fbd79ed4020 @bio_gender="male", @count="61", @ethnicity=:white_non_hispanic, @name="tyler", @rank="53", @year="2011">,
 #<Name:0x00007fbd79ed4b38 @bio_gender="male", @count="24", @ethnicity=:white_non_hispanic, @name="tristan", @rank="83", @year="2011">,
 #<Name:0x00007fbd79ed55d8 @bio_gender="male", @count="24", @ethnicity=:white_non_hispanic, @name="timothy", @rank="83", @year="2011">]
```

Cool. Now lets try a second argument:

```ruby
all_names.sort_by {|n| [n.year, n.name] }.take(5)
=> [#<Name:0x00007fbd7aaf8a90 @bio_gender="female", @count="63", @ethnicity=:hispanic, @name="aaliyah", @rank="30", @year="2011">,
#<Name:0x00007fbd79f67ed8 @bio_gender="female", @count="63", @ethnicity=:hispanic, @name="aaliyah", @rank="30", @year="2011">,
#<Name:0x00007fbd7a223ed8 @bio_gender="female", @count="63", @ethnicity=:hispanic, @name="aaliyah", @rank="30", @year="2011">,
#<Name:0x00007fbd7a82d6d0 @bio_gender="female", @count="69", @ethnicity=:black_non_hispanic, @name="aaliyah", @rank="5", @year="2011">,
#<Name:0x00007fbd7a180da0 @bio_gender="female", @count="69", @ethnicity=:black_non_hispanic, @name="aaliyah", @rank="5", @year="2011">]
```

Well, that was easy. Why don't the docs say `sort_by` can take multiple arguments? Sigh. 

Let's work this into our method, then...

Eh, I'm tired of this. `#sort` can now sort on two parameters (but no more than that), it has no error checking, but it woooorks. 

I'm done. Ready to take on the `futbol` project, after an _enormous_ break. 

Here's the commit: `7c3ca71`


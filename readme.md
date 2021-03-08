## Rebuilding Turing's Futbol Project

I've now worked with a number of Turing students on the [futbol](https://backend.turing.io/module1/projects/futbol/index) project.

There's a few consistent spots that they tend to get stuck on, but I'm not familiar enough with the right solution to guide them to it.

Also, I've always enjoyed re-writing Turing projects. They usually take a tiny fraction of the time they took me in Turing, and I gain an appreciation for design patterns I've read about in books like [Eloquent Ruby by Russ Owens (2011)](https://www.goodreads.com/book/show/9364729-eloquent-ruby?ac=1&from_search=true#) and Sandy Metz' famous [Practical Object-Oriented Design in Ruby](https://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330), and of course [Refactoring: Ruby Edition](https://www.goodreads.com/book/show/11560939-refactoring) by Jay Fields.

I'm building this resource with goals and constraints in mind:

### Goals

- share information in a way that advances the learning of a broad number of people, "beginner" through at least "intermediate".
- advance the related goals I've got described on [intermediateruby.com/about](https://intermediateruby.com/about)
- do this _quickly_. for a variety of reasons, I'm working on "shipping quickly"
- advance the state of current Turing students who avail themselves of this resource, _even if it's while they're doing the Futbol project_
- be accessible enough that someone who isn't even _in_ Turing could follow along, and probably gain some useful knowledge along the way. At minimum they'd get a laugh from at least one or two gifs ahead.
- Be "advanced" enough that someone who's about the level of a Turing grad a few months (or a year) out of Turing will still glean things of value. 
- Exemplify design considerations expressed in the various Ruby books I have lying around.
- Learn some super useful things about exploring in Git how files evolve over time.
- Find opportunities for focused applications of Ruby/Object-Oriented Design best practices. I've no doubt I'll make some sub-optimal implementations, and in time (maybe weeks/months from now) I'll read about some refactoring pattern, and I'll find a way to implement it in this project.


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
[https://github.com/josh-works/futbol/commit/4b3ca40](https://github.com/josh-works/futbol/commit/4b3ca40)

And you can figure out how to browse to the above commit in the repo (that's a whole sub-skill of itself I could talk about) and view the commit I just made _checks watch_ 3 minutes ago from when I type these words.

The timing doesn't matter a lot, but it matters _at least a little_, in that the way code changes over time tells a story, had a purpose and meaning. 

The _speed_ at which a story unfolds adds meaning to the story, so inasmuch as the time I've spent working on this (and how that might correlate to how quickly you could do ("worse"|"the same"|"better")) has implications. 

I just added the `busy constraint` in commit `c7dc5d4` which adds some context.

[https://github.com/josh-works/futbol/commit/c7dc5d4](https://github.com/josh-works/futbol/commit/c7dc5d4)

I'll also be using screenshots throughout this guide, so I need a location to store the screenshots. _you obviously don't need a screenshot directory_.

![here's how images work](/images/2021-03-02-at-3.45-PM-screenshot.jpg)

And that'll be another commit. Obviously you don't need to be committing like this or anything. I just want to explain every step of my process, so if you check out the specific commits I list in the future, you'll be able to understand all the constituent pieces of what's gone into the application.

`5668ba1`

[https://github.com/josh-works/futbol/commit/5668ba1](https://github.com/josh-works/futbol/commit/5668ba1)

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

[https://github.com/josh-works/futbol/commit/1f15647](https://github.com/josh-works/futbol/commit/1f15647)

## Let's set this thing up...

OH! Forgot to mention... I'm about 20 minutes into beginning this project, 2021-03-02. Most of that time has been writing the above "outline" of everything. After the last commit on march 2, I was out of the house for the evening, having a covid-safe outdoor dinner with some friends in Denver.

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

_go read the REALLY LONG README I wrote in the `/csv_exploration_lesson` directory. It's long, detailed, full of screenshots and useful learnings, and sets the stage for the futbol lesson._

_Much of what I'll cover in the next few hours will be at least partially based on learnings from that lesson, and your own learning outcomes will be vastly improved if you explore that lesson for yourself._

_Even if you don't complete it in the same way or to the same degree that I do, you'll be better off for the exploration_

## Continuing onward on the Futbol project setup

Did you spend a few hours working through the above CSV Exploration README? Take a look at the class that I built, in order to make it all pass: [https://github.com/josh-works/futbol/blob/master/csv_exploration_lesson/name.rb](https://github.com/josh-works/futbol/blob/master/csv_exploration_lesson/name.rb)

If there's a lot in there that is unintelligble to you, you _might_ not be ready to move to the Futbol project. 

Take a look at the file (and how it evolved over time) in [git history](https://github.githistory.xyz/josh-works/futbol/blob/master/csv_exploration_lesson/name.rb)

You'll get a feel for how software evolves. It's worth understanding!

Consider yourself warned...

## Manually create `lib` and `test` directories

add a `.keep` to the inside - that lets the file get added to `git` and you can commit it: `ea02997`

[ea02997](ea02997)

## download and explore CSV files

Download the CSVs, place them in a `data` directory.

It's tricky to get these files. You can download [their directory](https://github.com/turingschool-examples/futbol/tree/main/data) using this [github file downloader](download-directory.github.io)

[https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2Fturingschool-examples%2Ffutbol%2Ftree%2Fmain%2Fdata](https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2Fturingschool-examples%2Ffutbol%2Ftree%2Fmain%2Fdata)

Unzip the file, figure out how to get them in your `data` directory:

```
$ lr ~/Downloads | tail -10
-rw-rw-rw-@   1    1.0M Feb 27 11:47 stendahl1963.pdf
-rw-rw-rw-@   1    1.0M Feb 27 11:47 stendahl1963(1).pdf
-rw-rw-rw-@   1     78K Feb 27 12:06 qGhC3pM2.rss
-rw-r--r--@   1     98K Feb 27 14:44 .DS_Store
-rw-rw-rw-@   1     19M Feb 28 18:33 The Needful Annihilation -Mark 8.mp3
-rw-rw-rw-@   1    2.5M Mar  1 14:29 bloom-two-sigma(2).pdf
-rw-rw-rw-@   1     76K Mar  1 17:27 Benefit-Summary-Red-Canary.pdf
-rw-r--r--@   1    1.6M Mar  4 14:10 turingschool-examples futbol main data.zip
drwx------@ 734     23K Mar  4 14:10 .
drwxr-xr-x+ 162    5.1K Mar  4 14:16 ..
```

That bottom file is the one we want!

```shell
$ mv ~/Downloads/turingschool-examples\ futbol\ main\ data.zip ./data
# tab complete is a lifesaver
```

Here's what it looks like:

![download](/images/2021-03-04-at-2.17-PM-download-mv-data.jpg)

`lr` in my terminal is aliased to "`ls` the files, but [R]everse the order based on most recently updated"

The bottom entry, when calling `lr` is always the newest/most-recently-changed file/directory. It's quite handy.

unzip the file. I know there's an `unzip` utility, not sure how to use it, so looking it up in `tldr`:


![success](/images/2021-03-04-at-2.21-PM.jpg)

then delete the `zip`.

Now you've got the data in your `data` directory. Open up the CSVs, think about them for a minute.

you can do `open data/game_teams.csv` to open the CSV up in your local CSV-reading application. 

Add and commit it
---------------

## File I/O

This is the "hint" you get next:

```ruby
# runner.rb
require './lib/stat_tracker'

game_path = './data/games.csv'
team_path = './data/teams.csv'
game_teams_path = './data/game_teams.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)

require 'pry'; binding.pry
```

This is a big leap. I mean... it makes some sense to me, but it's a rough way to start the project. 

Why not try running it? I know it's not going to work, we've not created the `StatTracker` class, nor written a `from_csv` method. 

So, lets do that...

create base class: [8b736b5](8b736b5)

create runner file: [e951634](e951634)

run it:

```ruby
ruby runner.rb

From: /Users/joshthompson/me/projects/futbol/runner.rb:16 :

    11:   game_teams: game_teams_path
    12: }
    13:
    14: stat_tracker = StatTracker.from_csv(locations)
    15:
 => 16: require 'pry'; binding.pry

main:0> stat_tracker
=> nil
```

Cool.

And now the instructions say:

> `::from_csv` returns an instance of StatTracker. That instance of `StatTracker` will hold all of the information you need for the methods included in the remainder of the project description.



hm. The only next step is: [https://backend.turing.io/module1/projects/futbol/iterations/statistics](https://backend.turing.io/module1/projects/futbol/iterations/statistics)

Which doesn't talk much about how to set this thing up. 

So, I'll take a minute to think about it. I need to read ahead and see what might be expected for the application down the road.

For starters, I know I'm going to need:

1. A model with column-referencing attributes, so I can call something like `game.date_time` and get back the date/time for that particular `Game` instance.

Based on the CSV lesson we just did, I'll probably want to call methods on instances _and_ their classes. Something like:

```ruby
Games.all
Games.order_by(:date_time)

game.teams
game.home_goals
```

etc. 

Of course I'll need to write tests against those classes, because the non-TDD way I did the CSV lesson was _so painful and difficult_. We'll use real-world test-writing, and use it in such a way that it makes our lives _dramatically easier_. 

I don't have to worry too much about the long-term growth of this application, since I know at minimum a little about the stuff I'll do with `Games`. I'll just set that up next time I sit down, and I'll share the progress with you.

[9cfae08](9cfae08)

OK, outlined an idea game class, based on the first row of `game.csv`. I'm just making on attribute for every column.

I'll feed the data in probably as a comma-separated list, for now, so I'd call (again, copying now the 2nd line of the CSV):

```
"2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null"
```
```ruby
data = "2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
Game.new(data)
```
Here's what I've got... lets get it to run!

oh, yeah, requires are wrong. Lets peek at some existing test file somewhere...

And added a little front-matter in commit [3a64799](3a64799)

OK, test runs, now it gets an error, which... is to be expected.

(by the way, we're starting with some naïve initialization in a moment, I'll refactor down the road, according to the amazing book `Practical Object Oriented Design in Ruby`).

And the test passes:

[4494178](4494178)

Break time for me! Been a long day. I'm glad that I'm finally getting to write some of the code on this project, though!

----------------------

## Starting OO design

So, picking up with fleshing out the `Game` class.

Already, I know I'm going to want to improve the initialization process. It's quite fragile right now, but I'll let future design considerations drive updates to the initialization method.

For now, I know that when I create a new `game` instance, I can call:

```ruby
game.away_team_id
```

and get back an integer, like 15. That's the ID of an entry in `teams.csv`

I don't want to just be passing around _integers_, I want to be able to get the _actual team_.

So, I'll figure out how to be able to do:

```ruby
game.away_team
```
and it'll return an instance of the `Teams` class, corresponding to the underlying team. 

Before doing this, of course, I'll need a bare `Teams` class, and an associated test. For now, though, I'm going to write an "aspirational" test in my `Game` class that guides me in the right direction:

```ruby
def test_away_team_returns_a_team_object
  assert_instance_of Team, @game.away_team
end
```

This fails, of course... do you know why? Take a moment, think, why does this test fail, and _what specific error message will it generate_?

answer: uninitialized constant `Team`. Lets make it pass, but along the way, we'll start a `team_test.rb` file too.

`4b2f7bd`

Adding a test - notice how I'm using `data` in the `setup` method - that string (critically) ends with `"".split(",")`, which allows me to take the first row of data from the `teams.csv`, copy-paste it in here, and split it into an array, ready to be "consumed" by my `initialization` method.

This new test passes: `325feec`

So, back to my `Game` class, to figure out how to get `game.home_team` to return a `Team` instance.

## "Wiring Together" the Game and the Team

Currently, running the test, I get `Uninitialized Constant Team`. Let's add another `require` statement, but this time we're going to introduce a "test helper" file. This file will contain all necessary require statements and gems, and we'll simply require it from each additional test file we might create. Go look at this specific commit:

`c62ddd4`

It'll save you a lot of hassle down the road. This also solves our `Uninitialized Constant` problem - now we're getting `undefined method`, because there is no `away_team` method. Lets add it:

```ruby
def away_team
	# ??? What goes here???
end
```

We want a `Team` object back, and based on the CSV lesson we just did, we know we could do something like `Class.find(id)` and expect to find an instance of that class, with that ID.

How might you write this?

I used: 

```ruby
def away_team
	Team.find(away_team_id)
end
```

Remember - this isn't going to pass this test _at all_! I've not created a `Team#find` method on the `Teams` class, but I know I have an `away_team_id` available to this `Game` class, so... I'm good with this. I'll let this method drive me back towards writing code in the team class...

When I run the tests, I get:

```
NoMethodError: undefined method `find' for Team:Class
```

`b5ef633`

## Adding Team.find()

I added this test: 

```ruby
def test_find_class_method_finds_team_by_id
	assert_instance_of Team, Team.find(1)
end
```

Obviously, again, _it fails_ because I've not made it pass yet, but it tells me where to go.

I don't know that a team with that ID exists, but I think it does, because of the `data` I'm feeding in on the setup. The id looks like `1`, so I'm going to expect this method to return that particular instance of a `Team`, eventually.

Here's what I wrote in my `find` method:

```ruby
def self.find(id)
	all_teams.find {|team| team.id == id }
end
```

you might say:

> Josh, where'd that `all_teams` thing come from?

Good question. I've not written the method yet. When I run the tests, it'll throw an error about "all_teams", so lets _add a test_ for `all_teams`, and make it pass... (all the while, this test I just wrote, and the test in my `Game` class are still failing, this is fine, to be expected.)

I've renamed it, I'm going to do `Team.all` (class method) instead of `all_teams` (a different class method). 

[...]

OK, we're getting a little complicated, writing a lot of small methods. Try to stick with me...

Here's where I'm at:

`01b8a0d`

I have to figure out how to load up all my `teams` data. I am making a "private class method", that looks like so:

![load teams data](/images/2021-03-05-at-9.05-AM-load-teams-data.jpg)

Now's a great time to flip to `name.rb` in that CSV exploration lesson for inspiration...

I wrote out:

```ruby
def self.load_teams_data
	rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
	rows.map do |row|
		Team.new(row)
	end
end
```

Lets run the tests, see how it looks.

Ah, it needs the CSV class. I'll add a `require 'csv'` to the top of the file, though if you suspect we'll be using a helper file to handle all our requires soon... you'd be correct.

Here's the current state of things: `8feb80d`

When I run the tests, I have a failure and an error.

Here's the failures:

```
$ ruby test/team_test.rb
Run options: --seed 60717

# Running:

FE.

Fabulous run in 0.002825s, 1061.9469 runs/s, 2477.8761 assertions/s.

  1) Failure:
TeamTest#test_find_all_returns_all_teams [test/team_test.rb:25]:
Expected: 1
  Actual: 32

  2) Error:
TeamTest#test_find_class_method_finds_team_by_id:
NoMethodError: undefined method `id' for #<Team:0x00007fb4eb12cd78>
    /Users/joshthompson/me/projects/futbol/lib/team.rb:24:in `block in find'
    /Users/joshthompson/me/projects/futbol/lib/team.rb:24:in `each'
    /Users/joshthompson/me/projects/futbol/lib/team.rb:24:in `find'
    /Users/joshthompson/me/projects/futbol/lib/team.rb:24:in `find'
    test/team_test.rb:20:in `test_find_class_method_finds_team_by_id'

3 runs, 7 assertions, 1 failures, 1 errors, 0 skips
```
Now - I want you to take a moment and think about this, especially if you're getting the same errors.

In some ways, this is _exactly what I expected_, and is easily fixed. In other ways, it's also telling me I mis-labeled some things. It's not a problem, but it's easily fixed.

![do you see them](/images/2021-03-05-at-9.12-AM-spot-the-errors.jpg)

I'm now loading 32 teams, not 1, so my assertion on line 25 is coming back as 32 instead of 1. (This is a good thing!)

and I don't have a `team.id` attribute, I have a `team.team_id` attribute. Update the code and... my `find` is still broken.

Ah, it's because I'm saving `team_id` as a string, not an integer.

These are different:
```
"1"
1
```

I'll update my initialization method to convert the `team_id` to an integer, and all passes:

`52a2f44`

Lets try my other test, see how that looks...

[...]

Ah, I need to coerce all `id`-like bits of data to an integer. I'll go ahead and update the tests and initialize to convert more stuff to integers... and the tests pass:

`8978149`

Now lets add a `home_team` method (and test) and we're doing fine. Tests still pass.

`7f75e86`

----------------------------

## Digression to rake files

Now that we have two test files, while we often want to run a single test file, it would be nice to easily run _all_ of our test files, to make sure we didn't break something in another test file.

We could run it manually like:

```shell
$ ruby test/game_test.rb
# check results
$ ruby test/team_test.rb
# check results
```

That's a lot of typing, especially as the tests add up.

In the repository it was expected that you use as a base for this project (I didn't, built it from scratch) there's a `Rakefile`. Check it out:

[https://github.com/turingschool-examples/futbol/blob/main/Rakefile](https://github.com/turingschool-examples/futbol/blob/main/Rakefile)

Bring that Rakefile over to your current project. The filename is `Rakefile` (not `rakefile`, or `Rakefile.rb`), and copy/paste that stuff into it. Now, in your terminal, type `rake` and it runs _all_ your tests. `rake` and `rake test` are the same.

Here's how usage looks:

![rakefile](/images/2021-03-05-at-9.31-AM-adding-rakefile.jpg)

added it in this commit: `ef93f3b`

OK, next, even without looking at much other stuff in the spec, I know I'll want to know who won a particular game. 

If I have a `game` instance, I need to be able to call `game.winner` and get a `Team` instance back. Bonus points if that team happens to be _the winner_ for that game. (brilliant, right?)

So, I'll write out a test in `game_test.rb`, and let that drive me towards dealing with this `game_teams.csv`... stuff.

## Game#winner

Outlined my (failing) test here: `24d447f`. 

Now lets build a `game_teams` model. I'll need to be able to say, at minimum, something like:

```ruby
def winner
	GameTeam.winner_of_game(game_id)
end
```
and get back a `Team` object.

----------

Lets go build `GameTeam`!

(BTW, I know I'm going to need a `Class.all` method for `Game`. You can build your own implementation of that now if you want. There's no "exactly correct" order to how to do all this.)

So, outline my test, same as before. Update my `test_helper` to reference my new `game_team` class, and we have a passing test. `ecd0275`

A little more cleanup, anytime I have an `_id` attirbute, I can just coerce that string to an integer. In fact, most attibutes of `GameTeam` are integers (except for `#face_off_win_percentage` needs to be a `Float`), so lets do that...

Update tests, update code, test still passes in commit `ecf890f`

-----------

## Making all tests pass

Back to trying to make... which test pass again?

I know I have a failing test. I don't even remember what class it was in, though I could figure it out. Instead I'll run `rake`, to run all tests, and see which one(s) fail.

OK, I need a `winner_of_game` method that takes a `game_id` and returns a `Team` object that represents the winner of that game...

ooooh, crap. I don't need to call out to `GameTeam` from my `Game` class, the game knows who the winner is, based on the `home_goals` and `away_goals`. I can do logic on `self` and return the winning team....

here's what I aspirationally typed into my `Game#winner` method:

```ruby
def winner
	# GameTeam.winner_of_game(game_id)
	return away_team if away_team_won?
	return home_team if home_team_won?
end
```
those `away_team_won?` and `home_team_won?` methods have not been written yet.

OK, a little more code (lots of small, clearly-labeled methods) and we've got passing tests. Note the use of `private`, which denotes "these methods are not being tested". Saves me time of having to write more test code, and since these methods will never be "public" to other classes, it's... OK... to not test them. (er, this is a hot take, some people may strongly disagree. You're welcome to write this code however you want!)

Why not add a `loser` method too, just for completeness. I could see it making code more readable!

`cce5fd0`

## Refactoring `game.game_id` to `game.id`, `team.team_id` to `team.id`

now... I want to refactor this code a little. 

Because I've used ActiveRecord, a lot, I'm a fan of being able to call `id` on objects and just... get their `id` back. Here's how to do that, without adding much code at all:

Here's what it looks like:

![alias method](/images/2021-03-05-at-11.09-AM-alias-method.jpg)

And the commit: `afbeca3`

-------------

Let's take a look at the spec. I've not looked in a while. I could "garden" a bit more here. For example, I'll probably need the following methods:

```ruby
GameTeam.all
GameTeam.find(game_team_id)

Game.all
Game.find(game_id)

Team.all
Team.find(team_id)
```

This is a good spot to use a `Module` to enable this funcionality across all three classes without duplicating a bunch of code. I'll go ahead an add this, so you can get a feel for how it could work. First, lets add tests to all three classes that prove that this functionality will exist.

I've added failing tests here: `6ac30c6`

I already have this method in the `team_test` class, so I didn't add anything there.

OK, refactored to use a `module` for `Team#find`. Took a minute of Googling to figure out how to include the module on line 5 in such a way that I stopped getting a `method not found` error for `Team#find`. Team "Extends" `Finder`, per [Add class methods and instance methods to class by including one Module](http://rubyblog.pro/2017/04/class-methods-and-instance-methods-by-including-one-module)

commit: `ddcb7a7`

Lets extend this functionality to other classes now:

When I run `rake` I get:

```
Run options: --seed 19617

# Running:

.........E.E.

Fabulous run in 0.002867s, 4534.3565 runs/s, 14300.6627 assertions/s.

  1) Error:
GameTest#test_find_returns_game_by_id:
NoMethodError: undefined method `find' for Game:Class
    /Users/joshthompson/me/projects/futbol/test/game_test.rb:50:in `test_find_returns_game_by_id'

  2) Error:
GameTeamTest#test_find_returns_game_team_by_id:
NoMethodError: undefined method `find' for GameTeam:Class
    /Users/joshthompson/me/projects/futbol/test/game_team_test.rb:32:in `test_find_returns_game_team_by_id'

13 runs, 41 assertions, 0 failures, 2 errors, 0 skips
```

As expended, no `find` method available there. But I've got a module that has this method!

Now I've got no access to a method `all` for the class, so I'm going to add that to `finder` too....

OK, a bunch of code just happened. I undoubtedly made some leaps. Read the commits carefully. I've got a working version that passes all tests here:

`e944702`

and refactored some more...

`eeb2df4`

----------------------

## StatTracker methods

OK, there's a _ton_ of `StatTracker` methods we seem to need to do. 

Let's take a stab at just outlining the _very first method_, beginning-to-end, with tests and such...

```
Game Statistics:
highest_total_score | Highest sum of the winning and losing teams’ scores | Integer
```

OK. And they should be _instance methods_, not class methods. 

I'm continuously trying to write "aspirational" code, so here's what I have in my StatTracker class. Notice that I don't have a `GameStats` class, and it certainly doesn't have the given method on it.

```ruby
require './helper'

class StatTracker
  def self.from_csv(locations)
    
  end
  
  def highest_total_score
    GameStats.highest_total_score
  end
end
```

But... I can create that class, and it can probably interface with my `Game` class fairly nicely. 

------------

OK, bunch of futzing around. Messing with requires, to keep my code well-organized.

I've got a passing test (the first one) for my `GameStats` class:

`ca21d0d`

and refactored a bit more to make _all_ tests pass, with the usage of `rake`:

`ea56f01`

----------

## Getting the spec harness to run to validate that I'm doing anything even loosely correct

So, I have to use [this spec harness](https://github.com/turingschool-examples/futbol_spec_harness) to provide external evaluation of my code.

It can be a total PITA to set up, so let me walk you through it...

```shell
cd .. # this gets you one directory "up" from your `futbol` repo
git clone 
git@github.com:turingschool-examples/futbol_spec_harness.git
```

Now when you `ls` you should both `futbol_spec_harness` and `futbol` directories

```shell
cd futbol_spec_harness
atom . # to explore it, just for the heck of it. 
bundle # installs all dependencies
```

Run the tests with:

```shell
rspec
```

Now, it failed, all over the place. No sweat, I have to change `require` statements in my futbol repo. 

It better not eff with my tests I'm running locally....

Everywhere I have the following:

```
require './lib/...'
```

I'll change it to `require_relative ./...`


Commit showing the changes: 

Sigh. So frustrating. I'm losing a lot of time trying to make both my local tests and the spec harness run without errors.

Here's how I'm running the test:

```shell
$ rspec spec/stat_tracker_spec.rb:22
```

Appending `:22` to the command says run _just_ the test on that line, greatly reduces the output I have to scroll through.

TONS of `uninitialized constant` errors. 

I guess I'll just bite the bullet on the circular loading error, and accept the successful RSPEC output.

Here's the commit: `51d564d`

-------------------

## Rolling out first stats

So, I'm comfortable with my basic setup. I'll have my `StatTracker` make calls to `GameStat` class methods, and in the `GameStat` class I'll do the heavy lifting. 

I'll write tests for all of it, and yes, it's a bit annoying that I'm kinda "duplicating" the tests in `StatTracker` and `GameStat`. I think we'll find out quickly that this is still a helpful process, so bear with me as I do it.

Lemme brag on some copy-paste-terminal goodies.

I just copied-pasted the _table_ from the spec into named-and-ready-to-go test methods, en-mass.

I got from here:

```
lowest_total_score 	Lowest sum of the winning and losing teams’ scores 	Integer
percentage_home_wins 	Percentage of games that a home team has won (rounded to the nearest 100th) 	Float
percentage_visitor_wins 	Percentage of games that a visitor has won (rounded to the nearest 100th) 	Float
percentage_ties 	Percentage of games that has resulted in a tie (rounded to the nearest 100th) 	Float
count_of_games_by_season 	A hash with season names (e.g. 20122013) as keys and counts of games as values 	Hash
average_goals_per_game 	Average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th) 	Float
average_goals_by_season 	Average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th) 	Hash
```

to here:

```ruby
class GameStatsTest < Minitest::Test
  def test_highest_total_score
    assert_equal 11, GameStats.highest_total_score
  end
  
  ###############################
  #       GAME STATISTICS       #
  ###############################
  def test_lowest_total_score
    # Lowest sum of the winning and losing teams’ scores 	
    # => Integer
    
  end

  def test_percentage_home_wins
    # Percentage of games that a home team has won (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_percentage_visitor_wins
    # Percentage of games that a visitor has won (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_percentage_ties
    # Percentage of games that has resulted in a tie (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_count_of_games_by_season
    # A hash with season names (e.g. 20122013) as keys and counts of games as values 	
    # => Hash
    
  end

  def test_average_goals_per_game
    # Average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_average_goals_by_season
    # Average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th) 	
    # => Hash
    
  end

end
```

With just multi-cursor movement. Consider doing the same. It's helping me organize my tests _very_ cleanly.

Here's what I've got, as I've finished outlining the tests. I'm not committing to any of them, but it will help me know where I'm going.

commit `d232113`

---------------------

Next session. In the last few days I realized I want to do away with this `GameStats` class (I think) and work on building up `Game` query methods.

So, I've done that in this commit:

https://github.com/josh-works/futbol/commit/c0fa719

More complexity. I think I'd like to be able to do something like this:

```ruby
Game.where(winner: :home)
Game.where(winner: :away)
```

and, well, get the games where the winner was the home team. Seems like this would be handy, right? We can probably imagine ways of upgrading the value of the queries, and as long as we can make this work how we want, this will be a useful tool to have down the road.

To this end, here's the test I wrote:

```ruby
def test_where_home_won
	assert_equal 144, Game.where(winner: :home)
end
```

And here's my attempt at making it pass. I've not run the test yet, I know for a fact this is going to blow up:

```ruby

def self.where(query)
	key = query.first
	value = query.last
	Game.select do |game|
		game.send(key) == value
	end
end
```

Let's find out!

OK, didn't quite work as written, minor updates:

```ruby
def self.where(query)
	key = query.first[0]
	value = query[key]
	Game.all.select do |game|
		game.send(key) == game.send(value)
	end
end
```

OK, now that this method works (I wrote model tests for my Game class, along with a helper method or two.)

Commit:

https://github.com/josh-works/futbol/commit/ec325f5

## Naming inputs

Story time: I've got these two methods:

```ruby
def winner
	return away_team if away_team_won?
	return home_team if home_team_won?
end

def loser
	return away_team if !away_team_won?
	return home_team if !home_team_won?
end
```

Those call out to:

```ruby
def away_team_won?
	away_goals > home_goals
end

def home_team_won?
	home_goals > away_goals
end
```

See the problem?

This doesn't handle ties. What if both teams scored `3`?

I need to set up a test that lets me set up a game where both teams scored 3. Here's how I'm setting up a team right now in my test:

```ruby
data = "2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
@game = Game.new(data)
```

Which one of those numbers do I need to update to get a game with no winners?

Damned if I know. I went and looked at the `games.csv` data, tried counting, etc, it was ugly. Here's how I _want_ to be able to set up my game:

```ruby
data = {
	game_id: 2012030221
	,season: 20122013
	,type: "Postseason"
	,date_time: "5/16/13"
	,away_team_id: 3
	,home_team_id: 6
	,away_goals: 2
	,home_goals: 3
	,venue: "Toyota Stadium"
	,venue_link: "/api/v1/venues/null"
}
@game = Game.new(data)
```

See, because now I could specify the _exact_ values I want for goals, quite easily. 

I remember reading something in Practical Object-Oriented Design in Ruby about this...

Found it. Page 49: `Write Loosely Coupled Code: Isolate Multiparameter Initialization`. Sandi Metz says if you're _stuck_ relying on order-dependent object initialization, write a `wrapper` that takes a hash and makes a call to `Class.new` with the parameters correctly written. 

So, what we'd do is something like this:

```ruby
class GameMaker
	def self.new(data)
		Game.new(
			game_id: data[:game_id],
			season: data[:season],
			type: data[:type],
			home_team_id: data[:home_team_id],
			away_team_id: data[:away_team_id],
			home_goals: data[:home_goals],
			away_goals: data[:away_goals]
		)
	end
end
```
etc. Then, you could use it like:

```ruby
data = {
	home_goals: 3
	away_goals: 4
}
GameMaker.new(data)
=> # a new game instance
```

Let's take a stab at doing that. Mostly because its a good chance to practice building a wrapper around an inflexible interface (order-dependent initialization) and making it a more flexible interface (keyword-based object initialization). 

Cool, it works:

![wrapper](/images/2021-03-08-at-12.44-PM-initialization-wrapper.jpg)

This now allows me to do something like:

```ruby
GameMaker.new(home_goals: 3, away_goals: 4)
```
And I'll get a `Game` object with those values set. (Everything else will be `nil`, which is fine, for testing purposes.)

This lives in commit: https://github.com/josh-works/futbol/commit/0150cca

For evidence that this is working, here's the test that fails, using my `Game` initialization method:

```ruby
def test_when_no_winner
	data = {
		home_goals: 3,
		away_goals: 3
	}
	game = Game.new(data)
	assert_equal 3, game.home_goals
	assert_equal 3, game.away_goals
	assert_nil game.winner
end
```

And notice now using `GameMaker`, and it passes:

```ruby
def test_when_no_winner
	data = {
		home_goals: 3,
		away_goals: 3
	}
	game = GameMaker.new(data)
	assert_equal 3, game.home_goals
	assert_equal 3, game.away_goals
	assert_nil game.winner
end
```

This `GameMaker` pattern might help me down the road, as it'll allow me to initialize `Game` objects (and `Team` objects with a `TeamMaker`, etc) in a flexible way, which will make my test writing vastly easier. 



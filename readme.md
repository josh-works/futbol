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



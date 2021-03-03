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


### Constraints

- time, current knowledge
- I desire to "follow the path of most value", and I plan on this resource or a related resource to some day convey the kind of learning in a short enough time that people would plausibly spend non-trivial resources to learn more from. 
- I've been typing for 10 minutes and I'm hoping to have at least some of this project done in the next 30 minutes
- My wife and I are pretty busy today. It's also relevant how much income I bring in. I'm a husband, future father, neighbor, homeowner, etc. I've got lots of competing demands on my time, and I hope to not waste _your_ time that you might spend on this resource with me, no matter how you busy you are or are not. 

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





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

![here's how images work](/images/2021-03-02 at 3.45 PM-screenshot.jpg)

And that'll be another commit. Obviously you don't need to be committing like this or anything. I just want to explain every step of my process.





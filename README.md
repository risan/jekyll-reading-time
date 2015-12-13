# Jekyll Reading Time

This is a [Jekyll](http://jekyllrb.com/) plugin for displaying reading time duration for a given post, page, or any content. This plugin acts as a Jekyll [liquid filter](http://jekyllrb.com/docs/plugins/#liquid-filters). Heavily inspired by:

- [zachleat/reading_time.rb](https://gist.github.com/zachleat/5792681)
- [Medium Style Time to Read in Jekyll](http://jamiecollinson.com/blog/medium-style-time-to-read-in-jekyll/)

## Table of contents

* [Installation](#installation)
  * [Using Git](#using-git)
* [Configuration](#configuration)
* [Usage](#usage)

## Installation

To install this plugin simply download an put the [reading_time_filter.rb](https://github.com/risan/jekyll-reading-time/blob/master/reading_time_filter.rb) file inside `_plugins` directory on your Jekyll installation.

### Using Git

You may also download this plugin by leveraging Git command. Run the following command:

```bash
git clone https://github.com/risan/jekyll-reading-time.git /path/to/_plugins
```

Or if you prefer to use ssh:

```bash
git clone git@github.com:risan/jekyll-reading-time.git /path/to/_plugins
```

The above commands will download the repository to `_plugins/jekyll-reading-time` inside your Jekyll installation directory.

## Configuration

By default this plugin will use the follwing text durations as a suffix:

- seconds
- minute
- minutes

However you may override the default suffix, by adding this directives on your `_config.yml`:

```yml
reading_time:
  second_plural: "sec"    # default: seconds
  minute_singular: "min"  # default: minute
  minute_plural: "min"    # default: minutes
```

## Usage

To use this plugin, simply use it as a filter to your post content, page content, or any text.

```liquid
{{ "post content or any text" | reading_time }}
```

For a more complete example, consider you are looping through a post collection on `index.html`. You may display the reading time for each post like this:

```liquid
{% for post in site.posts %}
  <h2>{{ post.title }}</h2>
  <time>{{ post.date | date: "%b %-d, %Y" }}</time>
  <span>{{ post.content | reading_time }}</span>
  <div class="entry">{{ post.content }}</div>
{% endfor %}
```

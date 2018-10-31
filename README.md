# Jekyll Reading Time

A simple Jekyll plugin for displaying a reading time duration. It can either be a content from a post, a page, or a string.

Heavily inspired by this gist: [zachleat/reading_time.rb](https://gist.github.com/zachleat/5792681).

## Installation

Simply download the [reading_time_filter.rb](https://github.com/risan/jekyll-reading-time/blob/master/reading_time_filter.rb) file and store it within the `_plugins` directory on your Jekyll installation.

### Using Git

You can also use `git` to download the plugin:

```bash
$ git clone https://github.com/risan/jekyll-reading-time.git /path/to/_plugins
```

Or if you prefer to use ssh:

```bash
$ git clone git@github.com:risan/jekyll-reading-time.git /path/to/_plugins
```

## Configuration

By default, this plugin will use the following suffixes as a time duration:

* `seconds`: Plural form for second
* `minute`: Singular form for minute
* `minutes`: Plural form for minutes

You can override these suffixes by adding the `reading_time` directive to your `_config.yml` file:

```yml
reading_time:
  second_plural: "sec"    # default: seconds
  minute_singular: "min"  # default: minute
  minute_plural: "min"    # default: minutes
```

## Usage

This plugin registers a new Liquid filter that you can use to calculate the reading time duration. You can pass the content of a post, a page, or a string.

```liquid
{{ content | reading_time }}

{{ "Lorem ipsum dolor" | reading_time }}
```

Here's another example. Let's say you want to display all posts' title along with the reading time:

```liquid
<ul>
  {% for post in site.posts %}
    <li>
      <span>{{ post.title }}</span>
      <span>{{ post.content | reading_time }}</span>
    </li>
  {% endfor %}
</ul>
```

## License

MIT © [Risan Bagja Pradana](https://bagja.net)

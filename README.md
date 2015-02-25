# Breakman

A gem for breaking Rails apps.

# What? Why?

For live-fire debugging practice. Scared of error messages? Don't be. You'll get _lots_ of practice.

## Installation & Usage

Add this line to your application's Gemfile:

```ruby
gem 'breakman'
```

Then run

```
$ rake break
```

## Types of Errors / Configuration

TODO

* Flip class and instance methods / variables
* Flip include / extends
* Add space before method calls
* Delete dos / ends
* Add commas
* Mis-pluralize model / table names
* ...

Configuration of how many of which errors ...
Easy / medium / hard / nightmare modes (scaled based on cloc?) ...

## Contributing

1. Fork it ( https://github.com/[my-github-username]/breakman/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

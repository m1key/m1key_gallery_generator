# M1keyGalleryGenerator

This Ruby script generates www.m1key.me style gallery.

A sample gallery is this: http://www.m1key.me/photography/mauritania_part_2/

## Status

This is work in progress, but has been used to generate real-life galleries.

## Set up

### For Development

Install Ruby:

> dnf install ruby

Install Ruby Gem Bundler:

> dnf install rubygem-bundler

Install dependencies:

> ./bin/setup

Run the script on some test data. This is required to run other tests.
This assumes there is a valid gallery.yaml file present in the current folder,
and the photos themselves in the format DSC_1234.jpg. 
This is required to build tests.

> ruby -Ilib bin/console test/data

### Tests

Run other tests:

> rake

> rspec spec

## Development

### Build

To install this gem onto your local machine, run `bundle exec rake install`.

## Release

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Gem

To build gem:
> gem build m1key_gallery_generator.gemspec

To install gem:
> gem install m1key_gallery_generator-0.1.4.gem

To test gem:
> irb

> require 'm1key_gallery_generator'

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'm1key_gallery_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m1key_gallery_generator

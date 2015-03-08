# M1keyGalleryGenerator

This Ruby script generates www.m1key.me style gallery.

A sample gallery is this: http://www.m1key.me/photography/mauritania_part_2/

## Status

This is work in progress, but has been used to generate real-life galleries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm1key_gallery_generator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install m1key_gallery_generator

## Usage

> ruby -Ilib bin/gallery_generator test/data

This assumes there is a valid gallery.yaml file present in the current folder,
and the photos themselves in the format DSC_1234.jpg.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Tests

To run the Minitest tests:
> rake

To run the rspec tests:
> rspec spec

## Gem

To build gem:
> gem build gallery_generator.gemspec

To install gem:
> gem install gallery_generator-0.0.7.gem

To test gem:
> irb

> require 'gallery_generator'
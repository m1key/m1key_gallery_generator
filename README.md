# M1keyGalleryGenerator

This Ruby script generates www.m1key.me style gallery.

A sample gallery is this: https://www.m1key.me/photography/mauritania_part_2/

## Status

This is work in progress, but has been used to generate real-life galleries.

## Set up

### Fedora 35+

Install Ruby:

> dnf install ruby

Install Ruby Gem Bundler in Fedora 35 and higher:

> gem install bundler

> dnf install ruby-irb


### Ubuntu

Install Ruby using rbenv. Then:

> rbenv install 3.4.7

> rbenv global 3.4.7

> gem install bundler

### Windows

Install Ruby. This has been most recently tested on Ruby 3.4.7.

Install Gitbash.

> gem install bundler

### All

Install dependencies:

> ./bin/setup

## Tests

Run the script on some test data. This is required to run other tests.
This assumes there is a valid gallery.yaml file present in the current folder,
and the photos themselves in the format DSC_1234.jpg.
*This is required to run tests.*

> ruby -Ilib bin/console test/data

Run other tests:

> rake

> rspec spec

## Usage

This assumes you are running Windows.

Clone the project.

Build the gem.

> gem build m1key_gallery_generator.gemspec

Install the gem.

> gem install m1key_gallery_generator-0.3.8.gem

In your gallery directory, have a file called generate.bat that looks like this:

> ruby c:\Ruby34-x64\lib\ruby\gems\3.4.0\gems\m1key_gallery_generator-0.3.8\bin\console . wait_on_error

## Development

### Release

To release a new version, update the version number in `version.rb`,
commit your changes,
and then run `bundle exec rake release` to create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Gem

To build gem:
> gem build m1key_gallery_generator.gemspec

To install gem:
> gem install m1key_gallery_generator-0.3.8.gem

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

## Gotchas

Do not edit the templates in Atom due to its whitespace magic. I used vi instead.

# M1keyGalleryGenerator

This Ruby script generates https://www.m1key.me-style galleries.

A sample gallery: https://www.m1key.me/photography/mauritania_part_2/

## Status

Maintained, used, going strong.

## Set up

### Fedora

This was most recently tested on Fedora 43 Workstation.

Install rbenv using this command (the one shipped with the system is out of date):

```curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash```

Install Ruby:

```
rbenv install 4.0.2
rbenv global 4.0.2
gem install bundler
dnf install ruby-irb
```

### Ubuntu

This was most recently tested on Ubuntu 24.04.

Install rbenv using this command (the one shipped with the system is out of date):

```curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash```

Rbenv hackery:

```
apt install libffi-dev
apt install libyaml-dev
```

Then install Ruby:

```
rbenv install 4.0.2
rbenv global 4.0.2
gem install bundler
gem install rspec
```

### Windows

This was most recently tested on Windows 11.

Install Ruby 4.0.2 using rubyinstaller.org. Then run:

```gem install bundler```

### All

Install dependencies:

```bundle install```

## Tests

### Setup

```ruby -Ilib bin/console test/data```

### Synthetic gallery tests

```rake```

### Code-level tests

```rspec spec```

## Usage

This assumes you are running Windows.

Clone the project.

Build the gem.

```gem build m1key_gallery_generator.gemspec```

Install the gem.

```gem install m1key_gallery_generator-0.4.0.gem```

In your gallery directory, have a file called generate.bat that looks like this:

```ruby c:\Ruby40-x64\lib\ruby\gems\4.0.0\gems\m1key_gallery_generator-0.4.0\bin\console . wait_on_error```

## Development

### Release

To release a new version, update the version number in `version.rb`,
commit your changes,
and then run `bundle exec rake release` to create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

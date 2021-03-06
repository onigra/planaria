[![Gem Version](https://badge.fury.io/rb/planaria.svg)](http://badge.fury.io/rb/planaria) [![Build Status](https://travis-ci.org/onigra/planaria.svg)](https://travis-ci.org/onigra/planaria) [![Coverage Status](https://coveralls.io/repos/onigra/planaria/badge.svg?branch=master)](https://coveralls.io/r/onigra/planaria?branch=master) [![Code Climate](https://codeclimate.com/github/onigra/planaria/badges/gpa.svg)](https://codeclimate.com/github/onigra/planaria) [![Dependency Status](https://gemnasium.com/onigra/planaria.svg)](https://gemnasium.com/onigra/planaria)

# Planaria

Simple static template generator.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'planaria'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install planaria

## Usage

```sh
$ pln

Commands:
  pln build -n, --name=NAME                   # Create template
  pln divide -b, --base=BASE -n, --name=NAME  # Divide project
  pln help [COMMAND]                          # Describe available commands or one specific command
  pln init -n, --name=NAME                    # Create new template directories
```

#### init

```sh
$ pln init -n awesome_project

Create awesome_project project
./awesome_project
   +--css
   |   `--awesome_project.css
   +--html
   |   `--index.html.erb
   +--img
   +--js
   |   `--awesome_project.js
   +--yamls
      `--base.yml
```

#### build

```sh
$ pln build -n awesome_project

Generate awesome_project/base/index.html
```

#### divide

```sh
$ pln divide -n great_project -b awesome_project

Divide great_project project from awesome_project
./great_project
   +--css
   |   `--great_project.css
   +--html
   |   `--index.html.erb
   +--img
   +--js
   |   `--great_project.js
   +--yamls
      `--base.yml
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/onigra/planaria.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


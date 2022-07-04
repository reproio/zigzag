# Zigzag

Rubygems to encode Integer to zig-zag code

ref. following URLs

- https://en.wikipedia.org/wiki/Zigzag_code
- https://stackoverflow.com/questions/33935266/whats-the-reason-behind-zigzag-encoding-in-protocol-buffers-and-avro

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zigzag'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install zigzag

## Usage

```ruby
Zigzag.encode(12345)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test-unit` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reproio/zigzag.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

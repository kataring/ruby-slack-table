# SlackTable

- The SlackTable class creates and formats tables for Slack messages. It allows customization of title, columns, and data, providing a neat and clear presentation of tabular data in a Slack environment.

## Installation

```
gem install slack_table
```

## Usage

```ruby
require 'slack_table'

columns = [
  { title: 'Name', align: 'left', width: 10, index: :name },
  { title: 'Age', align: 'right', width: 3, index: :age },
  { title: 'City', align: 'left', width: 15, index: :city }
]

data = [
  '-',
  { name: 'Alice', age: 30, city: 'New York' },
  { name: 'Bob', age: 25, city: 'San Francisco' },
  { name: 'Charlie', age: 22, city: 'Tokyo' }
]

table = SlackTable.new(title: 'User Information', columns: columns, data: data)
puts table.render
```

````markdown
*User Information*
```
Name       Age City
------------------------------
Alice       30 New York
Bob         25 San Francisco
Charlie     22 Tokyo
```
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/kataring/slack_table-ruby>

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# OpenFdaApi

A simple Ruby wrapper for the [openFDA API](https://open.fda.gov/apis/).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_fda_api'
```

And then execute:
```shell
bundle install
```

## Documentation

There are 5 main category of endpoints that openFDA API provides: Drug, Device, Food, Other, and Tobacco.

Each category has further subcategories. Everything is accessible from the `OpenFdaApi.client`.


### Drug

The Drug API has the following endpoints: Adverse Events, Product Labeling, NDC Directory, Recall Enforcement Reports, and Drugs@FDA.

Here's how you interact with each:

#### Adverse Events
```ruby
require 'open_fda_api'

client = OpenFdaApi.client
drugs_api = client.drugs

arguments = [{"patient.reaction.reactionmeddrapt"=>"fatigue"}, {"occurcountry"=>"ca"}]
drugs_api.adverse_events(search_arguments: arguments) # => {"meta" => {...}, "results" => [...]}
```

### Device (Not Implemented Yet)
### Food (Not Implemented Yet)
### Other (Not Implemented Yet)
### Tobacco (Not Implemented Yet)



## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hebron-george/open_fda_api .
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/open_fda_api/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OpenFdaApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/open_fda_api/blob/master/CODE_OF_CONDUCT.md).

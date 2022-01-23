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

## Usage

```ruby
client = OpenFdaApi.client

# First 20 results where (fieldA=foo AND fieldB=bar) OR (fieldC=baz AND fieldA exists)
# Sorted by (fieldD) in descending order
# Skip the first 8 results
args = { 
  search: [{"fieldA" => "foo", "fieldB" => "bar"}, {"fieldC" => "baz", "_exists_" => "fieldA"}],
  sort: [{"fieldD" => "desc"}],
  skip: 8,
  limit: 20 
}

# Drug API
client.drugs.adverse_events(args)
client.drugs.product_labeling(args)
client.drugs.ndc_directory(args)
client.drugs.recall_enforcement_reports(args)
client.drugs.drugs_at_fda(args)

# Device API
client.device.premarket_501ks(args)
client.device.classification(args)
client.device.recall_enforcement_reports(args)
client.device.adverse_events(args)
client.device.premarket_approval(args)
client.device.recalls(args)
client.device.registrations_and_listings(args)
client.device.covid19_serological_tests(args)
client.device.unique_device_identifier(args)

# Food API
client.food.recall_enforcement_reports(args)
client.food.adverse_events(args)

# Other API
client.other.nsde(args)
client.other.substance_data_reports(args)

# Tobacco API
client.tobacco.problem_reports(args)
```

### Querying

The openFDA API can be queried with these arguments: `search`, `sort`, `count`, `skip`, and `limit`.

`search`, `sort`, and `count` have the same format. They are arrays of hashes. Each hash has a set of fields and values
that are ANDed together and all the elements in the array are ORed together. Here are some examples to illustrate:

```ruby
search = [{"patient.drug.openfda.pharm_class_epc" => "nonsteroidal+anti-inflammatory+drug" }]

# patient.drug.openfda.pharm_class_epc:"nonsteroidal+anti-inflammatory+drug"&count=patient.reaction.reactionmeddrapt.exact
```

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

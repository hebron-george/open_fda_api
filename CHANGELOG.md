## [Unreleased]

## [0.0.8] - 2022-01-24
- Delete the `OpenFdaApi.client` method since its only function was to forward messages

## [0.0.7] - 2022-01-23
- Use Faraday instead of using Net::HTTP directly
- Introduce `QueryInputs` to group query params passed in together

## [0.0.6] - 2022-01-21
- Support for more query fields

## [0.0.5] - 2022-01-20
- Validate, against search fields given to us from openFDA API, when building queries.

## [0.0.4] - 2022-01-19
- Fix version string in changelog.
- Update Query Builder to group search arguments properly.
- Update Query Builder to replace spaces with pluses in search values as openFDA API documentation requires.

## [0.0.3] - 2022-01-19
- Update version again because CHANGELOG wasn't updated along with the 0.0.2 release.

## [0.0.2] - 2022-01-19

- Add `OpenFdaApi::Client#drugs` to interact with the FDA Drug endpoints.
  - The `adverse_events` endpoint has been implemented in a very limited capacity.

## [0.0.1] - 2022-01-17

- Add `OpenFdaApi::Client.new(api_key:)` to create a client which does nothing right now.

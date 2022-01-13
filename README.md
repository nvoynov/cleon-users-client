# UsersClient

The `UsersClient` is just a demo gem to demonstrate how to create API client library for [UsersAPI](https://github.com/nvoynov/cleon-users-api).

* [UsersAPI](https://github.com/nvoynov/cleon-users-api)
* [Users](https://github.com/nvoynov/cleon-users)
* [Cleon](https://github.com/nvoynov/cleon)

The hart of the client is `ServicePort` class that utilizes `Typhoeus` for making HTTP requests. Library methods inside UsersClient just pass its arguments to appropriate service port.

Because [Users](https://github.com/nvoynov/cleon-users) domain created with Cleon's structure inside, you can easily enforce the API client by

- guarding arguments to prevent making wrong calls - just copy it from target domain;
- and using ready-to-use entities from the domain - just copy it from target domain.

## Installation

    $ git clone https://github.com/nvoynov/cleon-users-client

## Usage

A bit cumbersome ...

1. Clone [Users Domain](https://github.com/nvoynov/cleon-users)
2. Clone [Users API](https://github.com/nvoynov/cleon-users-api)
3. Install "Users API" following [README](https://github.com/nvoynov/cleon-users-api/README.md#installation) and start the service
4. Clone the repository and run tests

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/users_client.

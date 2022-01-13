# UsersClient

The `UsersClient` gem demonstrate how to create a library for [UsersAPI]().

Having in mind that the `UsersAPI` client serves as HTTP/JSON API face for [Users Domain](), which in turn is built using [Cleon](), one can utilize bunch of ready to use code from `Users Domain` (argument guards and entities).

Therefore this gem code mainly provide function of calling methods of HTTP/JSON face. These methods just do some simple porting HTTP calls work:

- guard arguments according to UsersDomain constraints;
- translate arguments into JSON Body or parameters;
- call the appropriate method of UsersAPI;
- and translate the call response into UsersDomain.

So, the structure is simple enough:

- `lib/users_client.rb` - contains main UsersDomain functions;
- `lib/users_client/ports.rb` - just gather all the following ports;
- `lib/users_client/version.rb` - important stuff to match UsersAPI version;
- `lib/users_client/ports/register_user_port.rb`
- `lib/users_client/ports/authenticate_user_port.rb`
- `lib/users_client/ports/change_user_password_port.rb`
- `lib/users_client/ports/select_users_port.rb`

CircutBracker?
JWT Authentication?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'users_client', git: '...'
```

And then execute:

    $ bundle install

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/users_client.

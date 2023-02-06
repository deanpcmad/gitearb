# GiteaRB

GiteaRB is a Ruby library for the Gitea API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "gitearb"
```

## Usage

### Set URL and Access Token

Firstly, you'll need to set the URL and Access Token like so:

```ruby
@client = Gitea::Client.new(url: "https://my-gitea-server.com", access_token: "")
```

### User

Retrieve details about the currently authenticated user.

```ruby
# Retrieves details about the current user
@client.user.get

# List all of your email addresses
@client.user.emails
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/gitearb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

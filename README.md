<a href="https://badge.fury.io/rb/snm-enum-transition"><img src="https://badge.fury.io/rb/snm-enum-transition.svg" alt="Gem Version" height="18"></a>

# Snm::Enum::Transition
Active Record ENUM based state machine. Whether you can control enum transation from one state to another state. Suppose you have an user model and you want to once user has been rejected he can't be verified, You can achive this job easily using this library.


## Installation
Add this line to your application's Gemfile:

```ruby
gem "snm-enum-transition"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install snm-enum-transition
```

## Usage

```ruby

# You have an user model and you want to specify status transitions: initial to verified, initial to rejected and rejected to initial


class User
  include Snm::Enum::Transition

  enum status: {initial: 0, verified: 1, rejected: 2]

  # Specify (allow enum transition) column name, from and to
  snm_enum_transitions :status, :initial, [:verified, :rejected]
  snm_enum_transitions :status, [:rejected], [:initial]
end

user = User.create(status: :initial)


# IF user status is initial
user.verified! # Okay
user.rejected! # Okay

# IF user status is verified
user.rejected! # ActiveRecord::RecordInvalid: Validation failed: Status can't be changed from verified to rejected
user.initial! # ActiveRecord::RecordInvalid: Validation failed: Status can't be changed from verified to initial

# IF user status is rejected
user.initial! # Okay
user.verified! # ActiveRecord::RecordInvalid: Validation failed: Status can't be changed from rejected to verified

```


## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/snmmaurya/snm-enum-transition. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

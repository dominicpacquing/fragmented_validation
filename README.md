Fragmented Validation
============

FragmentedValidation allows your model to only validate selected attributes.

Installation
============
Add this line to your application's Gemfile:

    gem 'fragmented_validation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fragmented_validation

Usage
============

## Getting Started

### Include the FragmentedValidation module by calling the 'fragmented_validation' in your model.



      class User < ActiveRecord::Base
          fragmented_validation
       end

### Validate single attribute

      person.email_valid?

#### Validate multiple attributes



    person.frag_validation_on(:username, :email)

  or

    person.frag_validation_except(:password)

Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



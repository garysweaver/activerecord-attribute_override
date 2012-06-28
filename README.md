ActiveRecord Attribute Override
=====

A gem that adds two methods to ActiveRecord::Base that let you override attributes of an ActiveRecord model instance much more easily and only when run in the environments you specify.

Currently the attributes are overriden only in the specified model instance. This is more useful than doing it for every instance of the model, as you might want to set test different data on different model instances.

#### Why?

If you have attributes that involve more complex relationships that you just want to quickly override for testing, although I'm sure there are other possible uses.

#### How does it work?

It's just a few instance_variable_set and instance_evals.

### Setup

In your Rails 3+ project, add this to your Gemfile:

    gem 'activerecord-attribute-override', :git => 'git://github.com/garysweaver/activerecord-attribute-override.git'

Then run:

    bundle install

### Usage

Some examples. Hopefully they are self-explanitory, combined with the description above. If no environment is specified, then Rails.env is not checked:

    my_model.override_attribute(:my_attribute_name, 'some value')
    my_model.override_attribute(:my_attribute_name, 'some value', :development)
    my_model.override_attribute(:my_attribute_name, 'some value', [:test, :production])
    my_model.override_attributes({my_attribute_name: 'some value', my_other_attribute_name: 'some other value'})
    my_model.override_attributes({my_attribute_name: 'some value', my_other_attribute_name: 'some other value'}, :development)
    my_model.override_attributes({my_attribute_name: 'some value', my_other_attribute_name: 'some other value'}, [:test, :production])

#### Using Without Rails

To use without Rails, either don't specify the environment(s), or define your own Rails.env outside of Rails to return the environment of your choice like:

    class Rails
      def self.env=(e); @@e = e; end
      def self.env; @@e; end
    end

    Rails.env = :foobar

### License

Copyright (c) 2012 Gary S. Weaver, released under the [MIT license][lic].

[lic]: http://github.com/garysweaver/activerecord-attribute-override/blob/master/LICENSE
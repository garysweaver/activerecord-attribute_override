ActiveRecord Attribute Override
=====

A gem that adds two methods to ActiveRecord::Base that let you override attributes of an ActiveRecord model instance much more easily and only when run in the environments you specify.

Currently the attributes are overriden only in the specified model instance. This is more useful than doing it for every instance of the model, as you might want to set test different data on different model instances.

Why is this needed? If you have attributes that involve more complex relationships and don't want to muddy up your models with checks for other attributes you set on them.

How does it work? A few instance_variable_set and instance_eval. See the [code][code]. Submit an issue if you have suggestions or problems.

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

[code]: http://github.com/garysweaver/activerecord-attribute-override/blob/master/lib/activerecord-attribute-override.rb
[lic]: http://github.com/garysweaver/activerecord-attribute-override/blob/master/LICENSE
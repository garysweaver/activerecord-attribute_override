ActiveRecord - Attribute Override
=====

A gem that adds two methods to ActiveRecord::Base that let you override attributes of an ActiveRecord model instance much more easily. It also allows you to specify the Rails environments in which the attributes should be overriden.

The attributes are overriden only in the specified model instance.

### Setup

In your Rails 3+ project, add this to your Gemfile:

    gem 'activerecord-attribute-override', :git => 'git://github.com/garysweaver/activerecord-attribute_override.git'

Then run:

    bundle install

### Usage

Override my_attribute_name method in my_model instance to return 'some value':

    my_model.override_attribute(:my_attribute_name, 'some value')

Override my_attribute_name method in my_model instance to return 'some value' only when Rails.env is 'development':

    my_model.override_attribute(:my_attribute_name, 'some value', :development)

Override my_attribute_name method in my_model instance to return 'some value' only when Rails.env is 'test' or 'production':

    my_model.override_attribute(:my_attribute_name, 'some value', [:test, :production])

Override my_attribute_name and my_other_attribute_name:

    my_model.override_attributes({my_attribute_name: 'some value', my_other_attribute_name: 'some other value'})

Override my_attribute_name and my_other_attribute_name only when Rails.env is 'development':

    my_model.override_attributes({my_attribute_name: 'some value', my_other_attribute_name: 'some other value'}, :development)

Override my_attribute_name and my_other_attribute_name only when Rails.env is 'test' or 'production':

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
require 'test/unit'
require 'activerecord-attribute-override'

module ActiveRecord
  class Base
    def method_missing(m, *args, &block); nil; end
  end
end

class Rails
  def self.env=(e); @@e = e; end
  def self.env; @@e; end
end

class TestModel < ActiveRecord::Base
end

class TestActiveRecordAttributeOverride < Test::Unit::TestCase
  
  def test_override_attribute
    a = TestModel.new
    a.override_attribute(:testing, :test)
    assert_equal :test, a.testing
    a = TestModel.new
    assert_equal nil, a.testing
  end

  def test_override_attribute_with_environment
    Rails.env = :development
    a = TestModel.new
    a.override_attribute(:testing, :test, :development)
    assert_equal :test, a.testing
    Rails.env = :bar
    a = TestModel.new
    a.override_attribute(:testing, :test, :bar)
    assert_equal :test, a.testing
    Rails.env = :production
    a = TestModel.new
    a.override_attribute(:testing, :test, :development)
    assert_equal nil, a.testing
  end

  def test_override_attribute_with_environments
    Rails.env = :development
    a = TestModel.new
    a.override_attribute(:testing, :test, [:development, :bar])
    assert_equal :test, a.testing
    Rails.env = :bar
    a = TestModel.new
    a.override_attribute(:testing, :test, [:development, :bar])
    assert_equal :test, a.testing
    Rails.env = :production
    a = TestModel.new
    a.override_attribute(:testing, :test, [:development, :bar])
    assert_equal nil, a.testing
  end

  def test_override_attributes
    a = TestModel.new
    a.override_attributes({:testing => :test})
    assert_equal :test, a.testing
    a = TestModel.new
    assert_equal nil, a.testing
  end

  def test_override_attribute_with_environment
    Rails.env = :development
    a = TestModel.new
    a.override_attributes({:testing => :test}, :development)
    assert_equal :test, a.testing
    Rails.env = :bar
    a = TestModel.new
    a.override_attributes({:testing => :test}, :bar)
    assert_equal :test, a.testing
    Rails.env = :production
    a = TestModel.new
    a.override_attributes({:testing => :test}, :development)
    assert_equal nil, a.testing
  end

  def test_override_attribute_with_environments
    Rails.env = :development
    a = TestModel.new
    a.override_attributes({:testing => :test}, [:development, :bar])
    assert_equal :test, a.testing
    Rails.env = :bar
    a = TestModel.new
    a.override_attributes({:testing => :test}, [:development, :bar])
    assert_equal :test, a.testing
    Rails.env = :production
    a = TestModel.new
    a.override_attributes({:testing => :test}, [:development, :bar])
    assert_equal nil, a.testing
  end
end
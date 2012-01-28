require 'spec_helper'

module InBedWith
  class Test < Base
    register :foo
    register :bar, :optional => true

    def code
      "foo_with_value_#{foo}"
    end
  end
end

describe InBedWith::Base do
  it 'raises an exception if a required attribute is missing' do
    lambda { InBedWith::Test.new }.should raise_exception ArgumentError, /config\.test_foo/
  end

  it 'does not raise an exception if an optional attribute is missing' do
    InBedWith::Test.new(foo: 'gazonk').code.should == 'foo_with_value_gazonk'
  end
end

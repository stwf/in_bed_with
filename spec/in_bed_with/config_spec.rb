require 'spec_helper'

describe InBedWith do
  it 'sets defaults with a block' do
    InBedWith.config do |config|
      config.analytics_property_id = 'abc123'
    end

    InBedWith.analytics_property_id.should == 'abc123'
  end
end

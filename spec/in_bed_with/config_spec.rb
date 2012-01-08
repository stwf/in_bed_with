require 'spec_helper'

describe InBedWith do
  it 'sets defaults with a block' do
    InBedWith.config do |config|
      config.analytics_pid = 'abc123'
    end

    InBedWith.analytics_pid.should == 'abc123'
  end
end

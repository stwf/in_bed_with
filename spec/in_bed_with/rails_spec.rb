require 'spec_helper'

module TestApp
  class Application < Rails::Application
    config.active_support.deprecation = :log
  end
end
TestApp::Application.initialize!

describe ActionView::Base do
  it 'should add in_bed_with helper through railtie' do
    InBedWith.config { |config| config.analytics_property_id = 'UA-7654321-1' }

    ActionView::Base.should respond_to(:in_bed_with)

    ActionView::Base.in_bed_with.should           == InBedWith
    ActionView::Base.in_bed_with.analytics.should =~ /UA-7654321-1/
  end
end

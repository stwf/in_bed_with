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

    view = ActionView::Base.new
    view.should respond_to(:in_bed_with)

    view.in_bed_with.should           == InBedWith
    view.in_bed_with.analytics.should =~ /UA-7654321-1/
  end
end

require 'spec_helper'

describe InBedWith::Gauges do
  it 'prints a javascript tag based on argument' do
    js = InBedWith.gauges(:site_id => '1234567890abcdef12345678')
    js.should == "<script type=\"text/javascript\">var _gauges = _gauges || []; (function() { var t = document.createElement('script'); t.type = 'text/javascript'; t.async = true; t.id = 'gauges-tracker'; t.setAttribute('data-site-id', '1234567890abcdef12345678'); t.src = '//secure.gaug.es/track.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(t, s); })();</script>"
  end

  it 'prints a javascript tag based on configuration option' do
    InBedWith.config { |config| config.gauges_site_id = '87654321fedcba0987654321' }
    js = InBedWith.gauges
    js.should == "<script type=\"text/javascript\">var _gauges = _gauges || []; (function() { var t = document.createElement('script'); t.type = 'text/javascript'; t.async = true; t.id = 'gauges-tracker'; t.setAttribute('data-site-id', '87654321fedcba0987654321'); t.src = '//secure.gaug.es/track.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(t, s); })();</script>"
  end
end

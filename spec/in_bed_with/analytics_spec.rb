require 'spec_helper'

describe InBedWith::Analytics do
  it 'prints a javascript tag based on argument' do
    js = InBedWith.analytics(:property_id => 'UA-1234567-1')
    js.should == "<script type=\"text/javascript\">var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-1234567-1']); _gaq.push(['_trackPageview']); (function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>"
  end

  it 'prints a javascript tag based on configuration option' do
    InBedWith.config { |config| config.analytics_property_id = 'UA-7654321-1' }
    js = InBedWith.analytics
    js.should == "<script type=\"text/javascript\">var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-7654321-1']); _gaq.push(['_trackPageview']); (function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>"
  end
end

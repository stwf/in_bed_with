require 'spec_helper'

describe InBedWith::Sitemeter do
  it 'prints a javascript tag based on argument' do
    js = InBedWith.sitemeter(site_name: '15CjNXRBjM')
    js.should == %(<!-- Site Meter -->
<script type="text/javascript" src="http://s10.sitemeter.com/js/counter.js?site=15CjNXRBjM">
</script>
<noscript>
<a href="http://s10.sitemeter.com/stats.asp?site=15CjNXRBjM" target="_top">
<img src="http://s10.sitemeter.com/meter.asp?site=15CjNXRBjM" alt="Site Meter" border="0"/></a>
</noscript>
<!-- Copyright (c)2009 Site Meter -->)
  end

  it 'prints a javascript tag based on configuration option' do
    InBedWith.config { |config| config.sitemeter_site_name = '15CjNXRBjM' }
    js = InBedWith.sitemeter
    js.should == %(<!-- Site Meter -->
<script type="text/javascript" src="http://s10.sitemeter.com/js/counter.js?site=15CjNXRBjM">
</script>
<noscript>
<a href="http://s10.sitemeter.com/stats.asp?site=15CjNXRBjM" target="_top">
<img src="http://s10.sitemeter.com/meter.asp?site=15CjNXRBjM" alt="Site Meter" border="0"/></a>
</noscript>
<!-- Copyright (c)2009 Site Meter -->)
  end
end

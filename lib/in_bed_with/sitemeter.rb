module InBedWith
  class Sitemeter < Base
    register :site_name

    def code
%(<!-- Site Meter -->
<script type="text/javascript" src="http://s10.sitemeter.com/js/counter.js?site=#{site_name}">
</script>
<noscript>
<a href="http://s10.sitemeter.com/stats.asp?site=#{site_name}" target="_top">
<img src="http://s10.sitemeter.com/meter.asp?site=#{site_name}" alt="Site Meter" border="0"/></a>
</noscript>
<!-- Copyright (c)2009 Site Meter -->)
    end
  end
end

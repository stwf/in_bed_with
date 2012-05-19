module InBedWith
  class Sitemeter < Base
    register :site_name

    def code
    	[
    		%(<script type="text/javascript" src="http://s13.sitemeter.com/js/counter.js?site=#{site_name}">),
    		%(</script>),
    		%(<noscript>),
    		%(<a href="http://s13.sitemeter.com/stats.asp?site=s13ffiles" target="_top">),
    		%(<img src="http://s13.sitemeter.com/meter.asp?site=s13ffiles" alt="Site Meter" border="0"/></a>),
    		%(</noscript>)
    	].join("")
    end
  end
end

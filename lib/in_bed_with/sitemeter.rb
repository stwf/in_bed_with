module InBedWith
  class Sitemeter < Base
    register :site_name
    register :site_server
    register :load_in_development, optional: true


    def code
      if ( ::Rails.env.development? && ! @load_in_development )
        answer = "<img src='/images/meter.gif'>"
      else
        answer = real_code
      end
      answer
    end

    def real_code
%(<!-- Site Meter -->
<script type="text/javascript" src="http://#{site_server}.sitemeter.com/js/counter.js?site=#{site_name}">
</script>
<noscript>
<a href="http://#{site_server}.sitemeter.com/stats.asp?site=#{site_name}" target="_top">
<img src="http://#{site_server}.sitemeter.com/meter.asp?site=#{site_name}" alt="Site Meter" border="0"/></a>
</noscript>
<!-- Copyright (c)2009 Site Meter -->)
    end
  end
end

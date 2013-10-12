module InBedWith
  class Analytics < Base
    register :property_id
    register :load_in_development, optional: true

    def code
      if do_not_display?
        answer = ""
      else
        answer = real_code
      end
      answer
    end

    def real_code
      "<script type=\"text/javascript\">var _gaq = _gaq || []; _gaq.push(['_setAccount', '#{property_id}']); _gaq.push(['_trackPageview']); (function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>"
    end
  end
end

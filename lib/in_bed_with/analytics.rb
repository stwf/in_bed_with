module InBedWith
  class Analytics
    attr_accessor :property_id

    def initialize(options={})
      self.property_id = options[:property_id] || InBedWith.analytics_property_id
    end

    def code
      raise ArgumentError, property_id_missing unless property_id

      "<script type=\"text/javascript\">var _gaq = _gaq || []; _gaq.push(['_setAccount', '#{property_id}']); _gaq.push(['_trackPageview']); (function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>"
    end

    private
      def property_id_missing
        'Please set a Google Analytics Property ID through config.analytics_property_id or by supplying :property_id when calling in_bed_with.analytics.'
      end
  end
end

module InBedWith
  class Gauges
    attr_accessor :site_id

    def initialize(options={})
      self.site_id = options[:site_id] || InBedWith.gauges_site_id
    end

    def code
      raise ArgumentError, site_id_missing unless site_id

      "<script type=\"text/javascript\">var _gauges = _gauges || []; (function() { var t = document.createElement('script'); t.type = 'text/javascript'; t.async = true; t.id = 'gauges-tracker'; t.setAttribute('data-site-id', '#{site_id}'); t.src = '//secure.gaug.es/track.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(t, s); })();</script>"
    end

    private
      def site_id_missing
        'Please set a Gauges Site ID through config.gauges_site_id or by supplying :site_id when calling in_bed_with.gauges.'
      end
  end
end

module InBedWith
  class Adsense < Base
    register :client
    register :slot
    register :type,   optional: true
    register :width,  optional: true
    register :height, optional: true

    AD_TYPES = {
      button:           { width: 125, height: 125 },
      half_banner:      { width: 234, height: 60  },
      banner:           { width: 468, height: 60  },
      vertical_banner:  { width: 120, height: 240 },
      leaderboard:      { width: 728, height: 90  },
      skyscraper:       { width: 468, height: 600 },
      wide_skyscraper:  { width: 160, height: 600 },
      small_square:     { width: 200, height: 200 },
      square:           { width: 250, height: 250 },
      small_rectangle:  { width: 180, height: 150 },
      medium_rectangle: { width: 300, height: 250 },
      large_rectangle:  { width: 336, height: 280 }
    }

    def code
      "<script type=\"text/javascript\">google_ad_client = '#{client}'; google_ad_slot = '#{slot}'; google_ad_width = #{properties[:width]}; google_ad_height = #{properties[:height]};</script><script type=\"text/javascript\" src=\"http://pagead2.googlesyndication.com/pagead/show_ads.js\"></script>"
    end

  private

    def properties
      if width && height
        { width: width, height: height }
      elsif type
        AD_TYPES[type] or raise ArgumentError, "Ad type '#{type}' is not known: Please use width and height parameters instead."
      else
        raise ArgumentError, 'Please set either type or height/width of the ad.'
      end
    end
  end
end

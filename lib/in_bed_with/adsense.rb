require 'rails'

module InBedWith
  class Adsense < Base
    register :client
    register :ad_slot
    register :ad_type,   optional: true
    register :ad_width,  optional: true
    register :ad_height, optional: true

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

    def real_code
      "<script type=\"text/javascript\">google_ad_client = '#{client}'; google_ad_slot = '#{ad_slot}'; google_ad_width = #{properties[:width]}; google_ad_height = #{properties[:height]};</script><script type=\"text/javascript\" src=\"http://pagead2.googlesyndication.com/pagead/show_ads.js\"></script>"
    end
    def code
      unless ::Rails.env.development?
        answer = real_code
      else
        answer = "<img src='468x60_image.png'>"
      end
      answer
    end

  private

    def properties
      if ad_width && ad_height
        { width: ad_width, height: ad_height }
      elsif ad_type
        AD_TYPES[ad_type.to_sym] or raise ArgumentError, "Ad type '#{ad_type}' is not known: Please use ad_width and ad_height parameters instead."
      else
        raise ArgumentError, 'Please set either ad_type or ad_height/ad_width of the ad.'
      end
    end
  end
end

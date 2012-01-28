require 'spec_helper'

describe InBedWith::Adsense do
  it 'prints a javascript tag based on argument' do
    js = InBedWith.adsense(client: 'ca-pub-1234567890123456', slot: '1234567890', width: 728, height: 90)
    js.should == "<script type=\"text/javascript\">google_ad_client = 'ca-pub-1234567890123456'; google_ad_slot = '1234567890'; google_ad_width = 728; google_ad_height = 90;</script><script type=\"text/javascript\" src=\"http://pagead2.googlesyndication.com/pagead/show_ads.js\"></script>"
  end

  it 'prints a javascript tag based on configuration option' do
    InBedWith.config do |config|
      config.adsense_client = 'ca-pub-1234567890123456'
      config.adsense_slot   = '1234567890'
      config.adsense_width  = 728
      config.adsense_height = 90
    end

    js = InBedWith.adsense
    js.should == "<script type=\"text/javascript\">google_ad_client = 'ca-pub-1234567890123456'; google_ad_slot = '1234567890'; google_ad_width = 728; google_ad_height = 90;</script><script type=\"text/javascript\" src=\"http://pagead2.googlesyndication.com/pagead/show_ads.js\"></script>"
  end

  context 'predefined ad types' do
    before do
      InBedWith.config do |config|
        %w(adsense_client adsense_slot adsense_width adsense_height).each { |opt| config.send("#{opt}=", nil) }
      end
    end

    it 'prints a javascript tag based on a predefined ad type' do
      js = InBedWith.adsense(client: 'ca-pub-1234567890123456', slot: '1234567890', ad_type: :leaderboard)
      js.should == "<script type=\"text/javascript\">google_ad_client = 'ca-pub-1234567890123456'; google_ad_slot = '1234567890'; google_ad_width = 728; google_ad_height = 90;</script><script type=\"text/javascript\" src=\"http://pagead2.googlesyndication.com/pagead/show_ads.js\"></script>"
    end

    it 'raises an exception if the ad type is not known' do
      lambda { InBedWith.adsense(client: 'ca-pub-1234567890123456', slot: '1234567890', ad_type: :foobarbaz) }.should raise_exception ArgumentError, /'foobarbaz' is not known/
    end
  end
end

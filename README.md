# in_bed_with
in_bed_with is a gem to easily embed common javascript snippets in your application. It's both very simple and much webscale!

Works with or without Rails, so it's very possible to use it with Sinatra or any other Ruby lib/framework.

## Installation
### As a rubygem
```
gem install in_bed_with
```

### With Bundler
In your Gemfile, add:

```
gem 'in_bed_with'
```

## How to use
### Rails
The simplest way to use **in_bed_with** in Rails is to create an initializer file `config/initializers/in_bed_with.rb`. Use it to specify the properties of the relevant service:

```
InBedWith.config do |config|
  config.analytics_property_id = 'UA-1234567-1'
end
```

Then, in your view, simply use:

```
<%= in_bed_with.analytics %> 
```

That's it!

If you don't want to set the properties through config, you can also pass any property into the method directly:

```
<%= in_bed_with.analytics(property_id: 'UA-1234567-1') %> 
```

This approach is also useful if you have multiple objects with different properties to embed. You can still specify defaults through the config:

```
# config/initializers/in_bed_with.rb
InBedWith.config do |config|
  config.adsense_client = 'ca-pub-1234567890123456'
  config.adsense_ad_type = :small_rectangle
end

# app/views/layouts/application.html.erb
# Will create a small rectangle ad with a slot parameter of '1234567890'
<%= in_bed_with.adsense(ad_slot: '1234567890') %>

# Will create a wide skyscraper ad with a slot parameter of '0987654321'
<%= in_bed_with.adsense(ad_slot: '0987654321', ad_type: :wide_skyscraper) %>
```

### Sinatra/Other
With Sinatra, you'll need to use the `helper` method to register the `in_bed_with` helper.

```
helper InBedWith::Helper
```

With any other lib/framework, use extend:

```
extend InBedWith::Helper
```

You can also forego the helper completely and call the `InBedWith` module directly:

```
InBedWith.analytics
# same as:
in_bed_with.analytics
```

## Service support
**in_bed_with** currently supports Google Analytics, Adsense and Gauges. Many more are planned--feel free to open an issue/pull request for integration with your favorite service!

### Google Analytics
**Available properties:**

* `property_id`: The ID of the property. Usually a string formatted along the likes of `UA-xxxxxxx-x`, where `x` is a digit.

**Example:**

```
# initializer
InBedWith.config do |config|
  config.analytics_property_id = 'UA-1234567-1'
end

# view
<%= in_bed_with.analytics %> 
```

### Google Adsense
**Available properties:**

* `client`: The Adsense client id. Usually a string formatted along the likes of `ca-pub–xxxxxxxxxxxxxxxx`, where `x` is a digit.
* `ad_slot`: The ad slot. Usually a 10-digit number.
* `ad_type`: The type of the ad. **Does not need to be set if both `ad_width` and `ad_height` are set**. Can be any of (see [here](https://support.google.com/adsense/bin/answer.py?hl=en-GB&answer=185665&topic=29561) for exact sizes):
	* `:banner`, `:button`, `:half_banner`, `:large_rectangle`, `:leaderboard`, `:medium_rectangle`, `:skyscraper`, `:small_rectangle`, `:small_square`, `:square`, `:vertical_banner`, `:wide_skyscraper`
* `ad_width`: The width of the ad. **Does not need to be set if `ad_type` is set**. Usually a 2 or 3-digit number.
* `ad_height`: The height of the ad. **Does not need to be set if `ad_type` is set**. Usually a 2 or 3-digit number.

**Example:**

```
# initializer
InBedWith.config do |config|
  config.adsense_client = 'ca-pub-1234567890123456'
  config.adsense_ad_type = :small_rectangle
end

# view
<%= in_bed_with.adsense(ad_slot: '1234567890') %>
```

### Gauges
**Available properties:**

* `site_id`: The ID of the site. (As far as I know) a 24-character hexadecimal string.

**Example:**

```
# initializer
InBedWith.config do |config|
  config.gauges_site_id = '1234567890abcdef12345678'
end

# view
<%= in_bed_with.gauges %> 
```

## Contributions
Pull requests for integration with additional service are very welcome!

### Pull requests
1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.

## License
`in_bed_with` is licensed under the MIT license. See `LICENSE` for details.

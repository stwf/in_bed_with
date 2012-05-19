require 'rubygems'
require 'bundler/setup'

require 'active_support/core_ext'
require 'active_support/inflector'

require 'in_bed_with/base'
require 'in_bed_with/adsense'
require 'in_bed_with/analytics'
require 'in_bed_with/quantcast'
require 'in_bed_with/sitemeter'
require 'in_bed_with/gauges'
require 'in_bed_with/version'

require 'in_bed_with/railtie' if defined?(Rails)

module InBedWith
  def self.config(&block)
    yield self
  end

  def self.method_missing(method, *args, &block)
    str = "InBedWith::#{method.to_s.camelize}".constantize.new(*args).code
    str.respond_to?(:html_safe) ? str.html_safe : str
  end
end

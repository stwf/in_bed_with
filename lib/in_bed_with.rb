require 'rubygems'
require 'bundler/setup'

require 'active_support/core_ext'
require 'active_support/inflector'

require 'in_bed_with/base'
require 'in_bed_with/analytics'
require 'in_bed_with/gauges'

require 'in_bed_with/railtie' if defined?(Rails)

module InBedWith
  mattr_accessor :analytics_property_id
  mattr_accessor :gauges_site_id

  def self.config(&block)
    yield self
  end

  def self.method_missing(method, *args, &block)
    "InBedWith::#{method.to_s.camelize}".constantize.new(*args).code
  end
end

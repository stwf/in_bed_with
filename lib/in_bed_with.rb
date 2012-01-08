require 'rubygems'
require 'bundler/setup'

require 'active_support/core_ext/module'

require 'in_bed_with/analytics'

module InBedWith
  mattr_accessor :analytics_pid

  def self.config(&block)
    yield self
  end
end

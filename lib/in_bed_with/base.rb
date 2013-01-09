module InBedWith
  class Base
    class << self
      attr_reader :attributes

      def register(attribute, options={})
        InBedWith.mattr_accessor module_attr(attribute)
        attr_accessor attribute

        @attributes ||= {}
        @attributes.merge!({ attribute.to_sym => options })
      end

      def module_attr(attribute)
        "#{name.demodulize.underscore}_#{attribute}"
      end
    end

    
    def initialize(attributes={})
      attributes.symbolize_keys!

      self.class.attributes.each do |attribute, options|
        value = attributes[attribute] || InBedWith.send(self.class.module_attr(attribute))

        raise ArgumentError, missing(attribute) unless value || options[:optional]

        self.send "#{attribute}=", value
      end
    end

    private
      def missing(attribute)
        "Please set #{self.class.name.demodulize} #{attribute.to_s.camelize} through config.#{self.class.module_attr(attribute)} or by supplying :#{attribute} when calling in_bed_with.#{self.class.name.demodulize.underscore}."
      end
  end

  module Helper
    def in_bed_with
      InBedWith
    end
  end
end

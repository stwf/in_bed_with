require 'rails/railtie'

module InBedWith
  module Rails
    module Helper
      def in_bed_with
        InBedWith
      end
    end

    class Railtie < ::Rails::Railtie
      initializer 'in_bed_with' do |app|
        ActiveSupport.on_load(:action_view) do
          extend Helper
        end
      end
    end
  end
end

require 'rails/railtie'

module InBedWith
  module Rails
    class Railtie < ::Rails::Railtie
      initializer 'in_bed_with' do |app|
        ActiveSupport.on_load(:action_view) do
          include Helper
        end
      end
    end
  end
end

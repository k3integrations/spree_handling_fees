Spree::AppConfiguration.class_eval do
  calculators = Rails.application.config.spree.calculators
  unless calculators.respond_to?(:stock_locations)
    calculators.singleton_class.class_eval { attr_accessor :stock_locations }
  end
  calculators.stock_locations ||= []
  Rails.application.config.spree.calculators.stock_locations = [
    Spree::Calculator::Shipping::FlatPercentItemTotal,
    Spree::Calculator::Shipping::FlatRate,
    Spree::Calculator::Shipping::FlexiRate,
    Spree::Calculator::Shipping::PerItem,
    Spree::Calculator::Shipping::PriceSack
  ]
end

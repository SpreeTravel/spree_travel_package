module Spree
  Product.class_eval do

    def package?
      self.product_type == Spree::ProductType.find_by_name('package')
    end

  end
end

module Spree
  class CalculatorPackage < BaseCalculator

    def adults_range
      0..1
    end

    def children_range
      0..1
    end

    def calculate_price(context, product)
      return [product.price.to_f] if product.rates.empty?
      prices = []
      days = context.end_date.to_date - context.start_date.to_date rescue 1

      product.rates.each do |r|
        next if context.start_date.present? && (context.start_date.to_date < r.start_date.to_date rescue false)
        next if context.end_date.present? && (context.end_date.to_date > r.end_date.to_date rescue false)
        adults_array = get_adult_list(r, context.adult)
        children_array = get_child_list(r, context.child)
        combinations = adults_array.product(children_array)
        combinations.each do |ad, ch|
          prices << get_rate_price(r, ad, ch) * days
        end
      end
      prices
    end

    def combination_string_for_generation(rate)
      ""
    end

    def combination_string_for_search(context)
      "%"
    end

    def get_rate_price(rate, adults, children)
      adults = adults.to_i
      children = children.to_i
      price = adults * rate.one_adult.to_i + children * rate.one_child.to_i
      price
    end

    private

    def get_adult_list(rate, pt_adults)
      if pt_adults.present?
        [pt_adults]
      else
        adults_range
      end
    end

    def get_child_list(rate, pt_child)
      if pt_child.present?
        [pt_child]
      else
        children_range
      end
    end


  end
end

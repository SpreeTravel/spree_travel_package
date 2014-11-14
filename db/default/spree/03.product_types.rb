### This is the data
rates = ['start_date', 'end_date', 'plan', 'simple', 'double', 'triple', 'one_child', 'one_adult']
contexts = ['start_date', 'end_date', 'adult', 'child']
variants = []

rate_option_types = rates.each.map {|r| Spree::OptionType.find_by_name(r)}
context_option_types = contexts.each.map {|c| Spree::OptionType.find_by_name(c)}
variant_option_types = variants.each.map {|v| Spree::OptionType.find_by_name(v)}

### Creating Product Type if not created
Spree::ProductType.where(:name => 'package').first_or_create(
   :presentation => 'Package',
   :rate_option_types => rate_option_types,
   :context_option_types => context_option_types,
   :variant_option_types => variant_option_types
)

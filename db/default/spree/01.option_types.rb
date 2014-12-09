### This is the data
option_types = [
  {:name => "start_date", :presentation => "Start Date", :attr_type => 'date', :short => 'Start'},
  {:name => "end_date", :presentation => "End Date", :attr_type => 'date', :short => 'End'},
  {:name => "adult", :presentation => "Adult", :attr_type => 'integer', :short => 'Adult'},
  {:name => "child", :presentation => "Child", :attr_type => 'integer', :short => 'Child'},
  {:name => "one_child", :presentation => "One Child", :attr_type => 'float', :short => 'Adult'},
  {:name => "one_adult", :presentation => "One Adult", :attr_type => 'float', :short => 'Child'},
  {:name => "destination", :presentation => "Destination", :attr_type => 'destination', :short => 'Dest'},
]

### Creating Option Types
option_types.each do |ot|
  Spree::OptionType.where(:name => ot[:name]).first_or_create(:presentation => ot[:presentation], :attr_type => ot[:attr_type])
end

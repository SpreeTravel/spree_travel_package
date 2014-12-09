require 'spec_helper'
require 'rake'

describe 'Rake task spree_travel_package:load' do
  before { Dummy::Application.load_tasks }

  it 'does not raise error' do
    expect { Rake::Task['spree_travel_package:load'].invoke }.not_to raise_exception
  end

  context 'inserts correctly' do
    before { Dummy::Application.load_tasks }
    it 'the calculator' do
      expect(Spree::TravelCalculator.where(:name => 'Spree::CalculatorPackage').first.product_type.name).to eq('package')
    end

    it 'the option types' do
      Rake::Task['spree_travel_package:load'].invoke
      expect(Spree::OptionType.where(:name => 'start_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'end_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'adult').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'child').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'one_child').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'one_adult').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'destination').count).to be_equal(1)
    end
  end
end
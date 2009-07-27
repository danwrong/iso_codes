require File.join(File.dirname(__FILE__), 'test_helper')

class CurrencyTest < Test::Unit::TestCase
  include ISOCodes
  
  should 'have data' do
    assert_instance_of Array, Currency.data
  end
  
  should 'return first matching item for #find' do
    currency = Currency.find(:code, 'GBP')
    assert_instance_of Currency, currency
    assert_equal 'GBP', currency.code
  end
  
  should 'have auto generated find_by_x methods' do
    
    %w(name code numeric country_a2).each do |field|
      assert Currency.respond_to?("find_by_#{field}")
    end
    
  end
  
  should 'have auto generated find_all_by_x methods' do
    
    %w(name code numeric country_a2).each do |field|
      assert Currency.respond_to?("find_all_by_#{field}")
    end
    
  end
  
  should 'return countries for #country' do
    currency = Currency.find_by_code('USD')
    assert_instance_of Array, currency.countries
    assert_instance_of Country, currency.countries.first
    assert(currency.countries.size > 1)
  end
  
  should 'find currency for a country given a Country object' do
    country = Country.find_by_a2('GB')
    currency = Currency.find_by_country(country)
    assert_equal 'GBP', currency.code
  end
end
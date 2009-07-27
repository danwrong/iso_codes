require File.join(File.dirname(__FILE__), 'test_helper')

class CountryTest < Test::Unit::TestCase
  include ISOCodes
  
  should 'have data' do
    assert_instance_of Array, Country.data
  end
  
  should 'return first matching item for #find' do
    country = Country.find(:a2, 'GB')
    assert_instance_of Country, country
    assert_equal 'GB', country.a2
  end
  
  should 'return all array of matching items for #find_all' do
    countries = Country.find_all_by_region('Europe')
    assert_instance_of Array, countries
    assert(countries.all? { |c| 
      c.region == 'Europe'
    })
  end
  
  should 'have auto generated find_by_x methods' do
    
    %w(name a2 a3 region subregion).each do |field|
      assert Country.respond_to?("find_by_#{field}")
    end
    
  end
  
  should 'have auto generated find_all_by_x methods' do
    
    %w(name a2 a3 region subregion).each do |field|
      assert Country.respond_to?("find_all_by_#{field}")
    end
    
  end
  
  should 'find the currency for a particular country' do
    country = Country.find_by_a2('GB')
    assert_instance_of Currency, country.currency
    assert_equal 'GBP', country.currency.code
  end
  
end
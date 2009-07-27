require 'iso_codes/data/currencies'

module ISOCodes
  
  class Currency < Base
    fields :name, :code, :numeric, :country_a2
    
    def self.data
      Data::Currencies
    end
    
    def countries
      country_a2.collect do |code|
        Country.find_by_a2(code)
      end
    end
    
    def self.find_by_country(country)
      country = country.a2 if country.is_a?(Country)
      
      data.each do |item|
        return self.new(item) if item[:country_a2].include?(country)
      end
    end
  end
  
end
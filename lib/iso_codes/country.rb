require 'iso_codes/data/countries'

module ISOCodes
  
  class Country < Base
    fields :name, :a2, :a3, :numeric, :region, :subregion
    
    def self.data
      Data::Countries
    end
    
    def currency
      @currency ||= Currency.find_by_country(self)
    end
  end
  
  
end
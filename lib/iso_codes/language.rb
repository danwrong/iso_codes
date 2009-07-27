require 'iso_codes/data/languages'

module ISOCodes
  
  class Language < Base
    fields :name, :a2
    
    def self.data
      Data::Languages
    end
  end
  
end
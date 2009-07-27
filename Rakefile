require 'echoe'
require 'fastercsv'

Echoe.new("iso_codes") do |p|
  p.author = "Dan Webb"
  p.email = 'dan@danwebb.net'
  p.summary = "Gem for finding and listing ISO codes for countries, currencies and languages"
  p.url = "http://github.com/danwrong/iso_codes/"
  p.retain_gemspec = true
end

namespace :import do
  
  desc 'Import data for countries'
  task :countries do
    countries = []
    FasterCSV.foreach('csv/countries.csv') do |row|
      countries << {
        :name => row[0],
        :a2 => row[1],
        :a3 => row[2],
        :numeric => row[3],
        :region => row[4],
        :subregion => row[5]
      }
    end
    
    File.open('lib/iso_codes/data/countries.rb', 'w') do |f|
      f.write("module ISOCodes\n  module Data\n    Countries = [\n")
      countries.each do |c|
        f.write("      #{c.inspect}")
        f.write(",\n") unless c == countries.last
      end
      f.write("]\n  end\nend")
    end
  end
  
  def search(array, key, value)
    array.each do |item|
      return item if item[key] == value
    end
    nil
  end
  
  desc 'Import data for currencies'
  task :currencies do
    require 'time'
    
    currencies = []
    FasterCSV.foreach('csv/currencies.csv') do |row|
      if row.last.nil? || Time.parse(row.last) > Time.now
        if item = search(currencies, :code, row[2])
          item[:country_a2] << row[1]
        else
          currencies << {
            :name => row[0],
            :country_a2 => [row[1]],
            :code => row[2],
            :numeric => row[3]
          }
        end
      end
    end
    
    File.open('lib/iso_codes/data/currencies.rb', 'w') do |f|
      f.write("module ISOCodes\n  module Data\n    Currencies = [\n")
      currencies.each do |c|
        f.write("      #{c.inspect}")
        f.write(",\n") unless c == currencies.last
      end
      f.write("]\n  end\nend")
    end
  end
  
  desc 'Import data for languages'
  task :languages do
    languages = []
    FasterCSV.foreach('csv/languages.csv') do |row|
      languages << {
        :name => row[0],
        :a2 => row[1]
      }
    end
    
    File.open('lib/iso_codes/data/languages.rb', 'w') do |f|
      f.write("module ISOCodes\n  module Data\n    Languages = [\n")
      languages.each do |c|
        f.write("      #{c.inspect}")
        f.write(",\n") unless c == languages.last
      end
      f.write("]\n  end\nend")
    end
  end
end

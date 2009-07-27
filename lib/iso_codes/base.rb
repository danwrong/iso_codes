module ISOCodes
  class Base    
    class << self
      def fields(*field_names)
        field_names.each do |field|
          attr_reader field
          create_finder field
        end
      end
    
      def find(field, val)
        data.each do |item|
          return self.new(item) if item[field.to_sym] == val
        end
        
        nil
      end
      
      def find_all(field, val)
        data.collect do |item|
          if item[field.to_sym] == val
            self.new(item)
          end
        end.compact
      end
      
      def all
        data.collect do |item|
          self.new(item)
        end
      end
      
      protected
      
      def create_finder(field)
        class_eval %{
          def self.find_by_#{field}(val)
            find(:#{field}, val)
          end
        
          def self.find_all_by_#{field}(val)
            find_all(:#{field}, val)
          end 
        }
      end
    end
    
    def initialize(data)
      data.each do |k, v|
        instance_variable_set :"@#{k}", v
      end
    end
  
  end
end
require File.join(File.dirname(__FILE__), 'test_helper')

class LanguageTest < Test::Unit::TestCase
  include ISOCodes
  
  should 'have data' do
    assert_instance_of Array, Language.data
  end
  
  should 'return first matching item for #find' do
    language = Language.find(:a2, 'en')
    assert_instance_of Language, language
    assert_equal 'en', language.a2
  end
  
  should 'have auto generated find_by_x methods' do
    
    %w(name a2).each do |field|
      assert Language.respond_to?("find_by_#{field}")
    end
    
  end
  
end
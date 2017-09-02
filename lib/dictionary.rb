require 'ruby-dictionary'
require 'awesome_print'



module Scrabble
  class OurDictionary

    def find(word)
      dictionary = Dictionary.from_file('lib/english3.txt')
      dictionary.exists?(word)

    end
  end
end

  #OUR ATTEMPT AT USING THE MW_DICTIONARY_API
  #We'd like to find out how to make this work!
  #
  #require 'mw_dictionary_api'
  # @client = MWDictionaryAPI::Client.new(ENV['ec412a70-7275-413a-a532-bb742a598286'], api_type: "collegiate")
  # result = @client.search(word)
  # ap result.to_h
  # return result.to_h

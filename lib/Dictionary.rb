require 'mw_dictionary_api'

module Scrabble
  class Dictionary

    def self.valid?(input)
      client = MWDictionaryAPI::Client.new('a31ed9a7-ec17-4981-b3d8-fee032116406', api_type: "collegiate")
      #client = MWDictionaryAPI::Client.new('12bc4a15-35de-4167-b5b5-3a04a3319584')

      result = client.search(input)
      result.entries.length > 0 ? true : false
    end
  end
end

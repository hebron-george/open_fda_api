# frozen_string_literal: true

module OpenFdaApi
  # Gives you access to the main nouns in the openFDA API
  class Client
    attr_reader :api_key

    def initialize(api_key:)
      @api_key = api_key
    end
  end
end

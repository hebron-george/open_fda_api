# frozen_string_literal: true

require_relative "./drugs"

module OpenFdaApi
  # Gives you access to the main nouns in the openFDA API
  class Client
    attr_reader :api_key

    def initialize(api_key: nil)
      @api_key = api_key
    end

    def drugs
      OpenFdaApi::Drugs.new
    end
  end
end

# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module OpenFdaApi
  # Gives you access to the main nouns in the openFDA API
  class Client
    attr_reader :api_key, :adapter

    BASE_URL = "https://api.fda.gov"

    def initialize(api_key: nil, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
      @stubs   = stubs
    end

    def drugs
      OpenFdaApi::Drugs.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json

        conn.response :dates
        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end

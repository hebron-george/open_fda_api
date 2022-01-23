# frozen_string_literal: true

require_relative "open_fda_api/version"
require_relative "open_fda_api/client"

# A Ruby wrapper for the openFDA API: https://open.fda.gov/apis/
module OpenFdaApi
  class Error < StandardError; end

  # TODO: Refactor client method out, it's literally just forwarding everything...
  def self.client(api_key: nil, adapter: Faraday.default_adapter, stubs: nil)
    OpenFdaApi::Client.new(api_key: api_key, adapter: adapter, stubs: stubs)
  end
end

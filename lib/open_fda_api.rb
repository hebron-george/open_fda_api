# frozen_string_literal: true

require_relative "open_fda_api/version"
require_relative "open_fda_api/client"

# A Ruby wrapper for the openFDA API: https://open.fda.gov/apis/
module OpenFdaApi
  class Error < StandardError; end

  def self.client(api_key: nil)
    OpenFdaApi::Client.new(api_key: api_key)
  end
end

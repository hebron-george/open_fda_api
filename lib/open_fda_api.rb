# frozen_string_literal: true

require_relative "open_fda_api/version"

# A Ruby wrapper for the openFDA API: https://open.fda.gov/apis/
module OpenFdaApi
  class Error < StandardError; end

  autoload :Client, "open_fda_api/client"
  autoload :Endpoint, "open_fda_api/endpoint"
  autoload :Drugs, "open_fda_api/drugs"
  autoload :Device, "open_fda_api/device"
  autoload :Food, "open_fda_api/food"
  autoload :QueryInputs, "open_fda_api/query_inputs"
  autoload :QueryBuilder, "open_fda_api/query_builder"
end

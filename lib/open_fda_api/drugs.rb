# frozen_string_literal: true

require "net/http"
require "json"
require "yaml"
require "open_fda_api/query_builder"

module OpenFdaApi
  # Interact with the Drugs API Endpoint:
  # - Adverse Events
  #  - Product Labeling
  #  - NDC Directory
  #  - Recall Enforcement Reports
  #  - Drugs@FDA)
  class Drugs
    def initialize
      @host = "api.fda.gov"
      @path_base = "/drug"
    end

    # The openFDA drug adverse event API returns data that has been collected from the
    # FDA Adverse Event Reporting System (FAERS), a database that contains information on
    # adverse event and medication error reports submitted to FDA.
    #
    # @param search [Array<Hash>] Search fields defined in https://open.fda.gov/apis/drug/event/searchable-fields/
    # @return Response from the API parsed as JSON
    def adverse_events(search: [], sort: [], count: [], skip: 0)
      endpoint = "/event.json"
      query    = build_query(search, sort, count, skip, self.class.valid_adverse_events_fields)
      url      = build_url(endpoint, query)
      make_request(url)
    end

    def self.valid_adverse_events_fields
      @valid_adverse_events_fields ||= ::YAML.load_file("#{__dir__}/adverse_events_fields.yml")
    end

    private

    def build_url(endpoint, query)
      URI::HTTPS.build(host: @host, path: @path_base + endpoint, query: query)
    end

    def build_query(search, sort, count, skip, valid_search_fields)
      QueryBuilder.new(search: search, sort: sort, count: count, skip: skip,
                       valid_search_fields: valid_search_fields).build_query
    end

    def make_request(url)
      JSON.parse(Net::HTTP.get(url))
    end
  end
end

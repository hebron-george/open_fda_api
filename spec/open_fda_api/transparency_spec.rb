# frozen_string_literal: true

RSpec.describe OpenFdaApi::Transparency do
  let(:instance) { client.transparency }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#complete_response_letters API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/transparency/crl.json") do |_env|
          [200, { "Content-Type" => "application/json" },
           File.read("spec/fixtures/transparency/crl.json")]
        end
      end
    end
    subject(:complete_response_letters_call) { instance.complete_response_letters }

    it "returns a response with meta and results" do
      expect(complete_response_letters_call).to include("meta", "results")
    end

    it "returns complete response letter records" do
      result = complete_response_letters_call["results"].first
      expect(result).to include(
        "application_number",
        "letter_type",
        "letter_date",
        "company_name",
        "approver_name",
        "approver_center"
      )
    end
  end
end

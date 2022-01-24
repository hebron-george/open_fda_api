# frozen_string_literal: true

require "rspec"

RSpec.describe OpenFdaApi::Other do
  let(:instance) { client.other }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#nsde API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/other/nsde.json") do |_env|
          [200, { "Content-Type" => "application/json" },
           File.read("spec/fixtures/other/nsde.json")]
        end
      end
    end
    subject(:nsde_call) { instance.nsde }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#substance_data_reports API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/other/substance.json") do |_env|
          [200, { "Content-Type" => "application/json" },
           File.read("spec/fixtures/other/substance.json")]
        end
      end
    end
    subject(:substance_data_reports_call) { instance.substance_data_reports }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end
end

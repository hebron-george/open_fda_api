# frozen_string_literal: true

require "rspec"

RSpec.describe OpenFdaApi::Food do
  let(:instance) { client.food }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#adverse_events API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/food/event.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/food/adverse_events.json")]
        end
      end
    end
    subject(:adverse_events_call) { instance.adverse_events }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end

  context "#recall_enforcement_reports API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/food/enforcement.json") do |_env|
          [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/food/enforcement.json")]
        end
      end
    end
    subject(:recall_enforcement_reports_call) { instance.recall_enforcement_reports }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end
end

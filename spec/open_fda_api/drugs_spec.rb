# frozen_string_literal: true

RSpec.describe OpenFdaApi::Drugs do
  let(:instance) { client.drugs }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }
  let(:stub) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("https://api.fda.gov/drug/event.json") do |_env|
        [200, { "Content-Type" => "application/json" }, File.read("spec/fixtures/drugs/adverse_events.json")]
      end
    end
  end

  context "#adverse_events API call" do
    subject(:adverse_events_call) { instance.adverse_events }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end
end

# frozen_string_literal: true

require "rspec"

RSpec.describe OpenFdaApi::AnimalAndVeterinary do
  let(:instance) { client.animal_and_veterinary }
  let(:client)   { OpenFdaApi::Client.new(adapter: :test, stubs: stub) }

  context "#adverse_events API call" do
    let(:stub) do
      Faraday::Adapter::Test::Stubs.new do |stub|
        stub.get("https://api.fda.gov/animalandveterinary/event.json") do |_env|
          [200, { "Content-Type" => "application/json" },
           File.read("spec/fixtures/animal_and_veterinary/adverse_events.json")]
        end
      end
    end
    subject(:adverse_events_call) { instance.adverse_events }
    it "converts the response to a Hash" do
      expect(subject.class).to eq(Hash)
    end
  end
end
